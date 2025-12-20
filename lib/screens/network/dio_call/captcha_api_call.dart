import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';

class GetCaptchaApi {
  DioClientCall dioClientCall = DioClientCall();

  Future<String> getCaptcha() async {
    try {
      debugPrint("api : ${ApiDeclaration.captchaUrl}");
      final res = await dioClientCall.get(ApiDeclaration.captchaUrl);
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}