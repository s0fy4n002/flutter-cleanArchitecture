import 'dart:convert';

import 'package:clean_architecture/features/profile/data/datasources/remote_datasource.dart';
import 'package:clean_architecture/features/profile/data/models/profile_model.dart';

void main() async {
  final RemoteDataSourceImpl remoteDataSource = RemoteDataSourceImpl();
  try {
    ProfileModel userResponse = await remoteDataSource.getUser(999999);

    String userJsonString = const JsonEncoder.withIndent(
      '  ',
    ).convert(userResponse.toJson());
    print(userJsonString);
  } catch (e) {
    print(e);
  }
}
