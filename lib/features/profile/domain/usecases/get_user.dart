import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/profile/data/repositories/profile_repository.dart';
import 'package:clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final ProfileRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, Profile>> execute(int id) async {
    return await repository.getUser(id);
  }
}
