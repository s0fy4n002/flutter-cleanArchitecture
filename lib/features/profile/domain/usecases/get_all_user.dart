import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/profile/domain/repositories/profile_repository.dart';
import 'package:clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:dartz/dartz.dart';

class GetAllUser {
  final ProfileRepository repository;

  GetAllUser(this.repository);

  Future<Either<Failure, List<Profile>>> execute(int page) async {
    return await repository.getAllUsers(page);
  }
}
