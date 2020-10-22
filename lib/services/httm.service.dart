import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:my_app/services/api.dart';
import 'package:my_app/services/shared_preferences.dart';
import 'package:my_app/utils/status.dart';
import 'api.dart';
import 'dart:io';

import 'package:my_app/services/User.dart';


class Auth with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status get loggedInStatus => _loggedInStatus;

  Status _signUpStatus = Status.NotRegistered;
  Status get signUpStatus => _signUpStatus;

  Future login(String userName, String password) async {
    final Map<String, dynamic> logins = {
      'username': userName,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await http.post(
      Api.STUDENT_LOGIN,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(logins),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['user'];
      print(userData);

      User authUser = User.fromJson(userData);

      // print(authUser.uid);
      CheckSharedPreferences.saveIdSharedPreference(authUser.uid);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      return {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      return {'status': false, 'message': json.decode(response.body)['error']};
    }
  }

  Future signUp(String userName, String password) async {
    final Map<String, dynamic> userData = {
      'username': userName,
      'password': password
    };

    _signUpStatus = Status.Registering;
    notifyListeners();

    Response response = await http.post(
      Api.STUDENT_SIGNUP,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      final Map<dynamic, dynamic> responseData = json.decode(response.body);

      var userData = responseData['user'];
      print(userData);
      User user = User.fromJson(userData);

      // UserPreferences().saveUser(authUser);
      CheckSharedPreferences.saveIdSharedPreference(userData._id);


      _signUpStatus = Status.Registered;
      notifyListeners();

      return {'status': true, 'message': 'Successful', 'user': user};
    } else {
      _signUpStatus = Status.NotRegistered;
      notifyListeners();
      return {'status': false, 'message': json.decode(response.body)['error']};
    }
  }
}
