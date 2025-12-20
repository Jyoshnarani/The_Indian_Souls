import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/logout_model.dart';

class LogOutAPI {
  DioClientCall dioClientCall = DioClientCall();

  Future<LogOutModel> doLogOut() async {
    try {

      Map<String, dynamic> headers =  ApiDeclaration.headersConfiguration(true);
      debugPrint("api : ${ApiDeclaration.logoutUrl}, \n headers : $headers ");
      final res = await dioClientCall.post(ApiDeclaration.logoutUrl, options: Options(headers: headers));
      return LogOutModel.fromJson(res);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
