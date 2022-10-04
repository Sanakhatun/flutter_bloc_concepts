/**
 * @Author: Sanakhatun Shaikh
 * @Date: 10/3/2022
 */

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: "https://62eff51c57311485d12b5ca5.mockapi.io/")
abstract class UserAPIClient {
  factory UserAPIClient(Dio dio) = _UserAPIClient;

  @GET("test")
  Future<String> getUsers();
}
