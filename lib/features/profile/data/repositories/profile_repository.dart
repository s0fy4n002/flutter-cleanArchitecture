import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<Profile>>> getAllUsers(int page);
  Future<Either<Failure, Profile>> getUser(int id);
}
