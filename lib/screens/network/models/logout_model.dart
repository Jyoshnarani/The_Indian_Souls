import 'dart:convert';

LogOutModel logOutModelFromJson(String str) => LogOutModel.fromJson(json.decode(str));

String logOutModelToJson(LogOutModel data) => json.encode(data.toJson());

class LogOutModel {
  bool success;
  String message;

  LogOutModel({
    required this.success,
    required this.message,
  });

  factory LogOutModel.fromJson(Map<String, dynamic> json) => LogOutModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
