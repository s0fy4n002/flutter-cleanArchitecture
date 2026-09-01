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

  //map -> ProfileModel
  factory ProfileModel.fromJson(Map<String, dynamic> dataJson) {
    Map<String, dynamic> data = dataJson['data'];

    return ProfileModel(
      id: data["id"],
      firstName: data["firstName"],
      lastName: data["lastName"],
      role: data["role"],
    );
  }

  //ProfileModel -> Map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "fullName": "$firstName $lastName",
      "role": role,
    };
  }
}
