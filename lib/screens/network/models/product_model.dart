
import 'dart:convert';
//
// ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));
//
// String productListModelToJson(ProductListModel data) => json.encode(data.toJson());
//
// class ProductListModel {
//   bool? success;
//   List<ProductData>? productData;
//
//   ProductListModel({
//      this.success,
//      this.productData,
//   });
//
//   factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
//     success: json["success"],
//     productData: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "data": List<dynamic>.from(productData!.map((x) => x.toJson())),
//   };
// }
//
// class ProductData {
//   int productId;
//   String productName;
//   String productPrice;
//   String productColor;
//   String productSize;
//
//   ProductData({
//     required this.productId,
//     required this.productName,
//     required this.productPrice,
//     required this.productColor,
//     required this.productSize,
//   });
//
//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//     productId: json["product_id"],
//     productName: json["product_name"],
//     productPrice: json["product_price"],
//     productColor: json["product_color"],
//     productSize: json["product_size"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product_id": productId,
//     "product_name": productName,
//     "product_price": productPrice,
//     "product_color": productColor,
//     "product_size": productSize,
//   };
// }

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) => json.encode(data.toJson());

class AllProductModel {
  bool success;
  int? page;
  int? limit;
  int? totalItems;
  int? totalPages;
  List<ProductData>? data;

  AllProductModel({
    required this.success,
     this.page,
     this.limit,
     this.totalItems,
     this.totalPages,
    this.data,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
    success: json["success"],
    page: json["page"],
    limit: json["limit"],
    totalItems: json["totalItems"],
    totalPages: json["totalPages"],
    data: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "page": page,
    "limit": limit,
    "totalItems": totalItems,
    "totalPages": totalPages,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductData {
  int productId;
  String productName;
  String productDescription;
  String productUrl;

  ProductData({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productUrl,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    productId: json["product_id"],
    productName: json["product_name"],
    productDescription: json["product_description"],
    productUrl: json["product_url"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_description": productDescription,
    "product_url": productUrl,
  };
}
