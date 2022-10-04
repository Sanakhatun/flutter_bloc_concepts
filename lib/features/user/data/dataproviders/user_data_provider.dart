/**
 * @Author: Sanakhatun Shaikh
 * @Date: 9/30/2022
 */

import 'package:flutter_bloc_concepts/features/user/data/models/user.dart';

abstract class UserDataProvider {
  /*Data from various source (network, database, etc.)*/
  Future<List<User>> getUsers();
}
