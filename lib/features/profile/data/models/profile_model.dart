import 'package:clean_architecture/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  final String firstName;
  final String lastName;

  const ProfileModel({
    required super.id,
    required this.firstName,
    required this.lastName,
    required super.email,
    required super.avatar,
  }) : super(fullName: "$firstName $lastName");

  //map -> ProfileModel
  factory ProfileModel.fromJson(Map<String, dynamic> dataJson) {
    Map<String, dynamic> data = dataJson;
    return ProfileModel(
      id: data["id"],
      firstName: data["first_name"],
      lastName: data["last_name"],
      email: data["email"],
      avatar: data["avatar"],
    );
  }

  //ProfileModel -> Map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "full_name": "$firstName $lastName",
      "avatar": avatar,
      "email": email,
    };
  }
}
