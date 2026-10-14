import 'dart:convert';

import 'package:clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<ProfileModel>> getAllUser(int page);
  Future<ProfileModel> getUser(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<ProfileModel>> getAllUser(int page) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page'),
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = json.decode(
        response.body,
      )['data'];
      return data.map((item) => ProfileModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
