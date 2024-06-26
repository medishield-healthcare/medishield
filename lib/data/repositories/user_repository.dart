import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medishield/data/repositories/authentication_repository.dart';
import 'package:medishield/features/authentication/models/user.dart';
import 'package:medishield/utils/http/http_client.dart';

class UserRepository extends GetxController {
  // fetch user data from server
  Future<UserModel> getUserData() async {
    final email = AuthenticationRepository.instance.deviceStorage.read('email');

    try {
      if (AuthenticationRepository.instance.deviceStorage.read('token') ==
          null) {
        return UserModel(
          firstName: 'Guest',
          lastName: 'User',
          email: '',
          password: '',
        );
      }
      final res = await THttpHelper.get('api/user/get/$email');
      debugPrint('User data: $res');
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
    try {
      final res = await THttpHelper.put(
        'api/user/edit-user',
        {
          'firstname': firstName,
          'lastname': lastName,
        },
      );
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  // update phone number to server
  Future<UserModel> updatePhoneData(
    String phone,
  ) async {
    try {
      final res = await THttpHelper.put(
        'api/user/edit-user',
        {
          'mobile': phone,
        },
      );
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
