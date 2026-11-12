import 'package:clean_architecture/features/profile/data/datasources/remote_datasource.dart';
import 'package:clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() async {
  final RemoteDataSourceImpl remoteDataSource = RemoteDataSourceImpl(
    client: http.Client(),
  );

  group("get user real", () {
    test("get user by id", () async {
      try {
        ProfileModel userResponse = await remoteDataSource.getUser(1);

        expect(userResponse, isA<ProfileModel>());
        expect(userResponse.id, 1);
      } catch (e) {
        fail("Failed to get user: $e");
      }
    });
  });
}
