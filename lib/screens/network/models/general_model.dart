import 'dart:convert';

GeneralModel generalModelFromJson(String str) => GeneralModel.fromJson(json.decode(str));

String generalModelToJson(GeneralModel data) => json.encode(data.toJson());

class GeneralModel {
  bool success;
  String message;

  GeneralModel({
    required this.success,
    required this.message,
  });

  factory GeneralModel.fromJson(Map<String, dynamic> json) => GeneralModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
