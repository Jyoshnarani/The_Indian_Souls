import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/general_model.dart';

class RegisterApiCall {
  DioClientCall dioClientCall = DioClientCall();

  Future<GeneralModel> registerUser(dynamic data) async {
    try {
      GeneralModel generalModel = GeneralModel(success: false, message: "");
      debugPrint(
        "api : ${ApiDeclaration.registerUrl},\n data : ${json.encode(data)} ",
      );
      await dioClientCall
          .post(ApiDeclaration.registerUrl, data: data)
          .then((value) {
            generalModel = GeneralModel.fromJson(value);
            if(generalModel.success){

            }
          })
          .catchError((error) {
            generalModel = GeneralModel(
              success: false,
              message: error.toString(),
            );
          });
      return generalModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
