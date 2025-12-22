import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  bool success;
  ProductDetailsData? data;

  ProductDetailsModel({
    required this.success,
    this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    success: json["success"],
    data: ProductDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
}

class ProductDetailsData {
  int productId;
  dynamic productTypeCode;
  dynamic returnMerchandiseAuthorizationNr;
  String productName;
  String productPrice;
  String productColor;
  String productSize;
  String productDescription;
  dynamic otherProductDetails;

  ProductDetailsData({
    required this.productId,
    required this.productTypeCode,
    required this.returnMerchandiseAuthorizationNr,
    required this.productName,
    required this.productPrice,
    required this.productColor,
    required this.productSize,
    required this.productDescription,
    required this.otherProductDetails,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) => ProductDetailsData(
    productId: json["product_id"],
    productTypeCode: json["product_type_code"],
    returnMerchandiseAuthorizationNr: json["return_merchandise_authorization_nr"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    productColor: json["product_color"],
    productSize: json["product_size"],
    productDescription: json["product_description"],
    otherProductDetails: json["other_product_details"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_type_code": productTypeCode,
    "return_merchandise_authorization_nr": returnMerchandiseAuthorizationNr,
    "product_name": productName,
    "product_price": productPrice,
    "product_color": productColor,
    "product_size": productSize,
    "product_description": productDescription,
    "other_product_details": otherProductDetails,
  };
}
