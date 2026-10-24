import 'dart:convert';

import 'package:clean_architecture/features/profile/data/datasources/remote_datasource.dart';
import 'package:clean_architecture/features/profile/data/models/profile_model.dart';

void main() async {
  final RemoteDataSourceImpl remoteDataSource = RemoteDataSourceImpl();
  List<ProfileModel> response = await remoteDataSource.getAllUser(1);

  for (var user in response) {
    String jsonString = const JsonEncoder.withIndent(
      '  ',
    ).convert(user.toJson());
    print(jsonString);
  }
}
