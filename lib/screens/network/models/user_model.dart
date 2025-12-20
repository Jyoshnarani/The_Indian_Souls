import 'dart:convert';

UserListModel userModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  bool success;
  String? message;
  UserData? data;

  UserListModel({
    required this.success,
    this.data,
    this.message,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    success: json["success"],
    data: UserData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class UserData {
  int customerId;
  dynamic organisationOrPerson;
  dynamic organisationName;
  dynamic gender;
  dynamic firstName;
  dynamic middleInitial;
  dynamic lastName;
  String emailAddress;
  String loginPassword;
  dynamic phoneNumber;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic addressLine3;
  dynamic addressLine4;
  dynamic townCity;
  dynamic county;
  dynamic country;

  UserData({
    required this.customerId,
    required this.organisationOrPerson,
    required this.organisationName,
    required this.gender,
    required this.firstName,
    required this.middleInitial,
    required this.lastName,
    required this.emailAddress,
    required this.loginPassword,
    required this.phoneNumber,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.addressLine4,
    required this.townCity,
    required this.county,
    required this.country,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    customerId: json["customer_id"],
    organisationOrPerson: json["organisation_or_person"],
    organisationName: json["organisation_name"],
    gender: json["gender"],
    firstName: json["first_name"],
    middleInitial: json["middle_initial"],
    lastName: json["last_name"],
    emailAddress: json["email_address"],
    loginPassword: json["login_password"],
    phoneNumber: json["phone_number"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    addressLine3: json["address_line_3"],
    addressLine4: json["address_line_4"],
    townCity: json["town_city"],
    county: json["county"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "organisation_or_person": organisationOrPerson,
    "organisation_name": organisationName,
    "gender": gender,
    "first_name": firstName,
    "middle_initial": middleInitial,
    "last_name": lastName,
    "email_address": emailAddress,
    "login_password": loginPassword,
    "phone_number": phoneNumber,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "address_line_3": addressLine3,
    "address_line_4": addressLine4,
    "town_city": townCity,
    "county": county,
    "country": country,
  };
}
