import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/models/captcha_model.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';

class GetCaptchaApi {
  Dio dio = Dio();

  Future<CaptchaModel> getCaptcha() async {
    try {
      CaptchaModel captchaModel = CaptchaModel();
      debugPrint("api : ${ApiDeclaration.captchaUrl}");
      await dio
          .get(ApiDeclaration.captchaUrl)
          .then((value) async {
            if (value.statusCode != null) {
              if (value.statusCode == 200) {
                final image = await saveSvgAsPng(value.data);
                captchaModel = CaptchaModel(
                  captchaId: int.parse(value.headers.value("Captcha-Id")!),
                  captchaImage: image,
                  massage: "Success",
                );
              }else
              if (value.statusCode == 400) {
                captchaModel = CaptchaModel(
                  captchaId: 0,
                  captchaImage: Uint8List(0),
                  massage: value.statusMessage,
                );
              } else
              if (value.statusCode! >= 400 && value.statusCode! < 500) {
                captchaModel = CaptchaModel(
                  captchaId: 0,
                  captchaImage: Uint8List(0),
                  massage: value.statusMessage,
                );
              } else {
                captchaModel = CaptchaModel(
                  captchaId: 0,
                  captchaImage: Uint8List(0),
                  massage: value.statusMessage,
                );
              }
            } else {
              captchaModel = CaptchaModel(
                captchaId: 0,
                captchaImage: Uint8List(0),
                massage: "Unknown Error",
              );
            }
          })
          .catchError((error) {
            captchaModel = CaptchaModel(
              captchaId: 0,
              captchaImage: Uint8List(0),
              massage: error.toString(),
            );
          });
      return captchaModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
