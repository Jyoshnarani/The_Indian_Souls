import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/general_model.dart';

class RegisterApiCall {
  DioClientCall dioClientCall = DioClientCall();

  Future<GeneralModel> registerUser(data) async {
    try {
      debugPrint("api : ${ApiDeclaration.registerUrl},\n data : ${json.encode(data)} ");
      final res = await dioClientCall.post(ApiDeclaration.registerUrl, data: data);
      return GeneralModel.fromJson(res);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
