import 'dart:convert';

import 'package:flutter/foundation.dart';

// CaptchaModel captchaModelFromJson(String str) =>
//     CaptchaModel.fromJson(json.decode(str));
//
// String captchaModelToJson(CaptchaModel data) => json.encode(data.toJson());

class CaptchaModel {
  int? captchaId;
  Uint8List? captchaImage;
  String? massage;

  CaptchaModel({this.captchaId, this.captchaImage, this.massage});

  // factory CaptchaModel.fromJson(Map<String, dynamic> json) => CaptchaModel(
  //   captchaId: json["captcha_id"],
  //   captchaImage: json["captcha_image"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "captcha_id": captchaId,
  //   "captcha_image": captchaImage,
  // };
}
