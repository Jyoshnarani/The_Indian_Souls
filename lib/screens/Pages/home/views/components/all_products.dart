import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/Pages/product/views/product_details_screen.dart';
import 'package:the_indian_souls/screens/components/product/product_card.dart';
import 'package:the_indian_souls/screens/network/dio_call/product_api_call.dart';
import 'package:the_indian_souls/screens/network/models/product_model.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => PopularProductsState();
}

class PopularProductsState extends State<PopularProducts> {
  List<ProductData> _productList = [];
  List<ProductData> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _searchController.addListener(_filterProducts);
  }

  void _fetchProducts() {
    ProductListAPI()
        .getAllProductList()
        .then((value) {
          if (value.success) {
            setState(() {
              _productList = value.data!;
              _filteredProducts = _productList;
            });
          } else {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: "Failed to load products.",
            );
          }
        })
        .catchError((error) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: error.toString(),
          );
        });
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _productList.where((product) {
        return product.productName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      duration: Duration(seconds: 10),
      overlayWidgetBuilder: (_) => Center(child: CircularProgressIndicator()),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: TextField(
              controller: _searchController,
              style: Theme.of(context).textTheme.titleMedium,
              decoration: InputDecoration(
                fillColor: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.05),
                hintText: 'Search products...',
                hintStyle:Theme.of(context).textTheme.titleMedium,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
              ),
              itemBuilder: (context, index) => ProductCard(
                image: _filteredProducts[index].productUrl,
                title: _filteredProducts[index].productName,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsScreen(
                          index: _filteredProducts[index].productId,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
