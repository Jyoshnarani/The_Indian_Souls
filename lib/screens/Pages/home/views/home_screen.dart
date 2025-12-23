import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/Pages/home/views/components/offers_carousel.dart';
import 'components/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // const SliverToBoxAdapter(child: OffersCarousel()),
            const SliverToBoxAdapter(child: PopularProducts()),
          ],
        ),
      ),
    );
  }
}
