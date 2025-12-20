import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/login_model.dart';

class LogInAPI {
  DioClientCall dioClientCall = DioClientCall();

  Future<LoginModel> doLogIn(String emailId, String password) async {
    try {
      LoginModel loginModel = LoginModel(
        success: false,
        message: "",
        data: Data(token: ""),
      );
      final data = json.encode({
        "email_address": emailId,
        "login_password": password,
      });
      debugPrint("api : ${ApiDeclaration.loginUrl},\n data : $data ");
      await dioClientCall
          .post(ApiDeclaration.loginUrl, data: data)
          .then((value) {
        loginModel = LoginModel.fromJson(value);
            // if (value.status == 200) {
            //   loginModel = LoginModel.fromJson(value.data);
            // } if (value.status == 400) {
            //   loginModel = LoginModel(
            //     success: false,
            //     message: value.message!.toString(),
            //     data: Data(token: ""),
            //   );
            // }if (value.status >= 400 && value.status < 500) {
            //   loginModel = LoginModel(
            //     success: false,
            //     message: value.message!.toString(),
            //     data: Data(token: ""),
            //   );
            // }else {
            //   loginModel = LoginModel(
            //     success: false,
            //     message: value.message!.toString(),
            //     data: Data(token: ""),
            //   );
            // }
          })
          .catchError((error) {
            loginModel = LoginModel(
              success: false,
              message: error.toString(),
              data: Data(token: ""),
            );
          });
      return loginModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
