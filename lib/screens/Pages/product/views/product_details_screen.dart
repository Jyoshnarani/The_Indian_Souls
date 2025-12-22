import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/network/dio_call/product_api_call.dart';
import 'package:the_indian_souls/screens/network/models/product_details_model.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';
import 'components/product_images.dart';
import 'components/product_info.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int index;

  const ProductDetailsScreen({super.key, required this.index});

  @override
  State<ProductDetailsScreen> createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<ProductDetailsData> productDetails = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchProductDetails());
  }

  Future<void> fetchProductDetails() async {
    context.loaderOverlay.show();
    await ProductListAPI()
        .getProductDetails(widget.index.toString())
        .then(
          (value) => {
            context.loaderOverlay.hide(),
            if (value.success)
              {
                setState(() {
                  productDetails = [value.data!];
                }),
              }
            else
              {
                context.loaderOverlay.hide(),
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  text: "",
                ),
              },
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      duration: Duration(seconds: 10),
      overlayWidgetBuilder: (_) => Center(child: CircularProgressIndicator()),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: productDetails.isEmpty ? const Center(child: CircularProgressIndicator()): CustomScrollView(
            slivers: [
              const ProductImages(images: [productImg1]),
              ProductInfo(
                size: productDetails.first.productSize,
                title: productDetails.first.productName,
                price: productDetails.first.productPrice,
                color: productDetails.first.productColor,
                desc: productDetails.first.productDescription,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
