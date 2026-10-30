import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:clean_architecture/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<Either<Failure, List<Profile>>> getAllUsers(int page) {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Profile>> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
