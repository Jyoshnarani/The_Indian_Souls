import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/user_model.dart';

class UserDetailsAPI {
  DioClientCall dioClientCall = DioClientCall();

  Future<UserListModel> getUserDetails() async {
    try {
      UserListModel userListModel = UserListModel(success: false);
      Map<String, dynamic> headers = ApiDeclaration.headersConfiguration(true);
      debugPrint("api : ${ApiDeclaration.profileUrl},\n headers : $headers ");
      await dioClientCall
          .get(ApiDeclaration.profileUrl, options: Options(headers: headers))
          .then((value) {
        userListModel = UserListModel.fromJson(value);
      }).catchError((error) {
        userListModel = UserListModel(success: false);
      });
      return userListModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<bool> updateUserProfile(Map<String, dynamic> updatedData) async {
    try {
      Map<String, dynamic> headers = ApiDeclaration.headersConfiguration(true);
      debugPrint("api : ${ApiDeclaration.profileUrl},\n headers : $headers, \n body: $updatedData");
      await dioClientCall.put(
        ApiDeclaration.profileUrl,
        data: updatedData,
        options: Options(headers: headers),
      );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
