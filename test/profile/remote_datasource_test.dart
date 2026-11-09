import 'dart:convert';

import 'package:clean_architecture/core/error/exception.dart';
import 'package:clean_architecture/features/profile/data/datasources/remote_datasource.dart';
import 'package:clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

// Annotation which generates the remote_datasource_test.mocks.dart library and the MockRemoteDataSource class.
@GenerateNiceMocks([MockSpec<RemoteDataSource>(), MockSpec<http.Client>()])
import 'remote_datasource_test.mocks.dart';

void main() async {
  MockClient mockClient = MockClient();
  // Create mock object.
  var remoteDataSource = MockRemoteDataSource();
  var remoteDataSourceImpl = RemoteDataSourceImpl(client: mockClient);

  const int userId = 1;
  const int page = 1;
  Uri urlGetUser = Uri.parse('https://reqres.in/api/users/$userId');

  ProfileModel fakeProfile = const ProfileModel(
    id: userId,
    firstName: 'M',
    lastName: 'Sofyansyah',
    email: 'john.doe@example.com',
    avatar: 'avatar_url',
  );

  Map<String, dynamic> fakeDataJson = fakeProfile.toJson();

  group("Test RemoteDataSource", () {
    group("getUser()", () {
      print("\n");
      test('success', () async {
        //proses stubing
        when(
          remoteDataSource.getUser(1),
        ).thenAnswer((Invocation invocation) async => fakeProfile);

        try {
          ProfileModel response = await remoteDataSource.getUser(1);
          print(response.toJson());
        } catch (e) {
          // Check if the exception is of type EmptyException.
          if (e is EmptyException) {
            print('Caught EmptyException: ${e.message}');
          } else {
            print('Caught unexpected exception: $e');
          }
        } finally {
          print("Test completed for get user success.");
        }
      });

      test('failed', () async {
        //proses stubing
        when(
          remoteDataSource.getUser(userId),
        ).thenThrow(EmptyException(message: 'User not found'));

        print('Calling getUser with id: $userId');

        try {
          ProfileModel response = await remoteDataSource.getUser(userId);
          print(response.toJson());
        } catch (e) {
          // Check if the exception is of type EmptyException.
          if (e is EmptyException) {
            print('Caught EmptyException: ${e.message}');
          } else {
            print('Caught unexpected exception: $e');
          }
        }
      });

      print("\n");
    });

    group("getAllUsers", () {
      test('success', () async {
        //proses stubing
        when(
          remoteDataSource.getAllUser(page),
        ).thenAnswer((Invocation invocation) async => [fakeProfile]);

        try {
          List<ProfileModel> response = await remoteDataSource.getAllUser(page);
          print(response.map((e) => e.toJson()).toList());
        } catch (e) {
          // Check if the exception is of type EmptyException.
          if (e is EmptyException) {
            print('Caught EmptyException: ${e.message}');
          } else {
            print('Caught unexpected exception: $e');
          }
        } finally {
          print("Test completed for get all users success.");
        }
      });
      print("\n");

      test('failed', () async {
        //proses stubing
        when(
          remoteDataSource.getAllUser(page),
        ).thenThrow(EmptyException(message: 'No users found'));

        try {
          List<ProfileModel> response = await remoteDataSource.getAllUser(page);
          print(response.map((e) => e.toJson()).toList());
        } catch (e) {
          // Check if the exception is of type EmptyException.
          if (e is EmptyException) {
            print('Caught EmptyException: ${e.message}');
          } else {
            print('Caught unexpected exception: $e');
          }
        }
      });
    });
  });

  group("Test RemoteDataSourceImpl", () {
    group("getUserImpl", () {
      test(
        'harus mengembalikan ProfileModel ketika response code 200 (Sukses)',
        () async {
          // Arrange
          final tResponseJson = json.encode({"data": fakeDataJson});

          when(
            mockClient.get(urlGetUser),
          ).thenAnswer((_) async => http.Response(tResponseJson, 200));

          // Act
          final result = await remoteDataSourceImpl.getUser(userId);

          // Assert
          expect(result, isA<ProfileModel>());
          expect(result.toJson(), fakeDataJson);
          verify(mockClient.get(urlGetUser)).called(1);
        },
      );
    });
  });
}
