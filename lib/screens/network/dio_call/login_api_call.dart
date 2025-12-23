import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/login_model.dart';

class LogInAPI {
  DioClientCall dioClientCall = DioClientCall();

  Future<LoginModel> doLogIn(
    String emailId,
    String password,
    int captchaId,
    String captchaText,
  ) async {
    try {
      LoginModel loginModel = LoginModel(success: false, message: "");
      final data = json.encode({
        "email_address": emailId,
        "login_password": password,
        "captcha_id": captchaId,
        "captcha_text": captchaText,
      });
      debugPrint("api : ${ApiDeclaration.loginUrl},\n data : $data ");
      await dioClientCall
          .post(ApiDeclaration.loginUrl, data: data)
          .then((value) {
            loginModel = LoginModel.fromJson(value);
          })
          .catchError((error) {
            loginModel = LoginModel(success: false, message: error.toString());
          });
      return loginModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
