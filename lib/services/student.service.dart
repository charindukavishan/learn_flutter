import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:my_app/services/api.dart';
import 'package:my_app/utils/status.dart';
import 'api.dart';
import 'dart:io';

import 'package:my_app/services/User.dart';


class Auth with ChangeNotifier {
  Status _isLoading = Status.Loaded;
  Status get isLoadingState => _isLoading;

  
  Future<User> getStudent(String userName) async {


    _isLoading = Status.Loading;
    notifyListeners();

    Response response = await http.get(
      Api.GET_STUDENT+"/"+userName,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // var userData = responseData['user'];
      // print(userData);
      User authUser = User.fromJson(json.decode(response.body));

      // UserPreferences().saveUser(authUser);

      // _loggedInStatus = Status.LoggedIn;
      // notifyListeners();

      return authUser;
    } else {
      // _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      throw Exception('Failed to load album');
    }
  }
}