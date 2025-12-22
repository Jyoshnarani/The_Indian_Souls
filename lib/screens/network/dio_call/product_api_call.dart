import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/product_details_model.dart';
import 'package:the_indian_souls/screens/network/models/product_model.dart';

class ProductListAPI {
  DioClientCall dioClientCall = DioClientCall();

  Future<ProductListModel> getAllProductList() async {
    try {
      ProductListModel productListModel = ProductListModel(
        success: false,
        productData: [],
      );
      debugPrint("api : ${ApiDeclaration.productsUrl}");
      await dioClientCall
          .get(ApiDeclaration.productsUrl)
          .then((value) {
            productListModel = ProductListModel.fromJson(value);
          })
          .catchError((error) {
            productListModel = ProductListModel(
              success: false,
              productData: [],
            );
          });
      return productListModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<ProductDetailsModel> getProductDetails(String productId) async {
    try {
      ProductDetailsModel productDetailsModel = ProductDetailsModel(
        success: false,
      );
      debugPrint("api : ${ApiDeclaration.productsUrl}/$productId");
      await dioClientCall
          .get("${ApiDeclaration.productsUrl}/$productId")
          .then((value) {
            productDetailsModel = ProductDetailsModel.fromJson(value);
          })
          .catchError((error) {
            productDetailsModel = ProductDetailsModel(success: false);
          });
      return productDetailsModel;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
