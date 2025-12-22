import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/Pages/product/views/product_details_screen.dart';
import 'package:the_indian_souls/screens/components/product/product_card.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/product_api_call.dart';
import 'package:the_indian_souls/screens/network/models/product_model.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => PopularProductsState();
}

class PopularProductsState extends State<PopularProducts> {
  List<ProductData> productList = [];

  @override
  void initState() {
    super.initState();
    ProductListAPI()
        .getAllProductList()
        .then(
          (value) => {
            if (value.success!)
              {
                setState(() {
                  productList = value.productData!;
                }),
              }
            else
              {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  text: "",
                ),
              },
          },
        )
        .catchError((error) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: error,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Products",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == productList.length - 1 ? defaultPadding : 0,
                ),
                child: ProductCard(
                  // image: productList[index].image,
                  title: productList[index].productName,
                  price: productList[index].productPrice,
                  colour: productList[index].productColor,
                  size: productList[index].productSize,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsScreen(
                            index: productList[index].productId,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
