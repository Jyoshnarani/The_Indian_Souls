import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_client_call.dart';
import 'package:the_indian_souls/screens/network/models/product_model.dart';

class ProductListAPI {
  DioClientCall dioClientCall = DioClientCall();

  Future<ProductListModel> getProductDetails() async {
    try {
      ProductListModel productListModel = ProductListModel(success: false, productData: []);
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
}
