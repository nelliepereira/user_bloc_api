import 'dart:convert';

import 'package:user_bloc_api/api_connection/users_service.dart';
import 'package:user_bloc_api/model/users_class.dart';

class UsersRepository {
  Future<List<UsersClass>> getUsersApiData() async {
    final userConnection = await UserService.getUsersApiConnection();

    if (userConnection.statusCode == 200) {
      List<UsersClass> usersData = [];
      var tempUserClassData = jsonDecode(userConnection.body);
      tempUserClassData.forEach((element){
      //  usersData = tempUserClassData;
        usersData.add(UsersClass.fromJson(element));
      });
        return usersData;
    } else {
      return [];
    }

  }
}