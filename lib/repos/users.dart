
import 'dart:convert';

import '../models/user.dart';
import '../utilities/constants.dart';
import '../utilities/http_wrapper.dart';

class Users {
  String endPoint = "users";
  Future<List<User>> getUsers() async {
    try {
      String response = await HttpWrapper().get(Constants.BASE_URL + endPoint);
      Map jsonResponse = jsonDecode(response);
      Iterable usersIterable = jsonResponse['data'];
      List<User> usersList =
          usersIterable.map((jsonItem) => User.fromJson(jsonItem)).toList();
      return usersList;
    } catch (error) {
      throw Exception("Something wrong happened");
    }
  }
}
