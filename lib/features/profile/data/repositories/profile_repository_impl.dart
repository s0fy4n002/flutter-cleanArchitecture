import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/profile/data/datasources/local_datasource.dart';
import 'package:clean_architecture/features/profile/data/datasources/remote_datasource.dart';
import 'package:clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:clean_architecture/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final HiveInterface hive;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.hive,
  });

  @override
  Future<Either<Failure, List<Profile>>> getAllUsers(int page) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    try {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<ProfileModel> profileData = await localDataSource.getAllUser(page);
        return Right(profileData);
      } else {
        List<ProfileModel> profileData = await remoteDataSource.getAllUser(
          page,
        );
        await hive.box('profiles').put('page_$page', profileData);
        return Right(profileData);
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Profile>> getUser(int id) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    try {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        ProfileModel profileData = await localDataSource.getUser(id);
        return Right(profileData);
      } else {
        ProfileModel profileData = await remoteDataSource.getUser(id);
        await hive.box('profiles').put('user_$id', profileData);
        return Right(profileData);
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
