import 'dart:convert';

import 'package:clean_architecture/core/error/exception.dart';
import 'package:clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<ProfileModel>> getAllUser(int page);
  Future<ProfileModel> getUser(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProfileModel>> getAllUser(int page) async {
    final response = await client.get(
      Uri.parse('https://reqres.in/api/users?page=$page'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((item) => ProfileModel.fromJson(item)).toList();
    } else {
      throw ServerException(message: 'Failed to load users');
    }
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    // TODO: implement getUser
    Uri url = Uri.parse('https://reqres.in/api/users/$id');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)['data'];

      return ProfileModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw const EmptyException(message: 'User tidak ditemukan');
    } else {
      throw const ServerException(message: 'Failed to load user');
    }
  }
}
