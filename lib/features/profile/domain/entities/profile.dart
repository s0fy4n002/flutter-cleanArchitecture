import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String fullName;
  final String role;

  const Profile({required this.id, required this.fullName, required this.role});

  @override
  List<Object> get props => [id, fullName, role];
}
