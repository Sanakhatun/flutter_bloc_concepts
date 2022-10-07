import 'dart:convert';

import 'package:flutter_bloc_concepts/features/user/data/dataproviders/remote/user_api_client.dart';
import 'package:flutter_bloc_concepts/features/user/data/dataproviders/user_data_provider.dart';
import 'package:flutter_bloc_concepts/features/user/data/models/user.dart';
import 'package:dio/dio.dart';

/**
 * @Author: Sanakhatun Shaikh
 * @Date: 10/2/2022
 */

class UserRepository extends UserDataProvider {
  late final UserDataProvider userApi;

  late final Dio _dio;
  late final UserAPIClient _userAPIClient;

  UserRepository() {
    _dio = Dio();
    _userAPIClient = UserAPIClient(_dio);
  }

  @override
  Future<List<User>> getUsers() async {
    final String rawUserResponse = await _userAPIClient.getUsers();
    /*For Raw data to Map Conversion*/
    /* User.fromJson(jsonDecode(rawUserResponse)); */
    List<User> userList = (jsonDecode(rawUserResponse) as List)
        .map((i) => User.fromJson(i))
        .toList();

    print(" user list: ${userList.length}");

    return userList;
  }
}
