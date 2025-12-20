import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/network/models/product_model.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';
import 'components/product_images.dart';
import 'components/product_info.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductData productData;

  const ProductDetailsScreen({super.key, required this.productData});

  @override
  State<ProductDetailsScreen> createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ProductImages(
              images: [productImg1],
            ),
            ProductInfo(
              size: widget.productData.productSize,
              title: widget.productData.productName,
              price: widget.productData.productPrice,
              color: widget.productData.productColor,
            ),
          ],
        ),
      ),
    );
  }
}
