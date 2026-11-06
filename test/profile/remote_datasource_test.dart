import 'package:clean_architecture/core/error/exception.dart';
import 'package:clean_architecture/features/profile/data/datasources/remote_datasource.dart';
import 'package:clean_architecture/features/profile/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the remote_datasource_test.mocks.dart library and the MockRemoteDataSource class.
@GenerateNiceMocks([MockSpec<RemoteDataSource>()])
import 'remote_datasource_test.mocks.dart';

void main() async {
  // Create mock object.
  var remoteDataSource = MockRemoteDataSource();

  const int id = 1;
  ProfileModel fakeProfile = const ProfileModel(
    id: id,
    firstName: 'M',
    lastName: 'Sofyansyah',
    email: 'john.doe@example.com',
    avatar: 'avatar_url',
  );

  group("Test RemoteDatasource", () {
    test('get user success', () async {
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

      print("\n");
      print("\n");
      print("\n");
    });

    test('get user failed', () async {
      //proses stubing
      when(
        remoteDataSource.getUser(id),
      ).thenThrow(EmptyException(message: 'User not found'));

      print('Calling getUser with id: $id');

      try {
        ProfileModel response = await remoteDataSource.getUser(id);
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
  });
}
