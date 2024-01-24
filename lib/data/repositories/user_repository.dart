import 'package:get/get.dart';
import 'package:medishield/data/repositories/authentication_repository.dart';
import 'package:medishield/features/authentication/models/user.dart';
import 'package:medishield/utils/http/http_client.dart';

class UserRepository extends GetxController {
  // fetch user data from server
  Future<UserModel> getUserData() async {
    final email = AuthenticationRepository.instance.deviceStorage.read('email');
    try {
      final res = await THttpHelper.get('api/user/get/$email');
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  // update user data to server
  Future<UserModel> updateUserData(
    String firstName,
    String lastName,
  ) async {
    final token = AuthenticationRepository.instance.deviceStorage.read('token');
    try {
      final res = await THttpHelper.put(
          'api/user/edit-user',
          {
            'firstname': firstName,
            'lastname': lastName,
          },
          token);
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  // delete user data from server
}
