import 'package:clean_architecture/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  final String firstName;
  final String lastName;

  const ProfileModel({
    required super.id,
    required this.firstName,
    required this.lastName,
    required super.role,
  }) : super(fullName: "$firstName $lastName");
}
