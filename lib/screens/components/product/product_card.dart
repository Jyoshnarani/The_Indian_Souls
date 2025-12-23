import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/components/network_image_with_loader.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.image,
    required this.title,
    required this.press,
  });

  final String? image;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(140, 220),
        maximumSize: const Size(140, 220),
        padding: const EdgeInsets.all(8),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.1,
            child: Stack(
              children: [
                NetworkImageWithLoader(
                  image!,
                  radius: defaultBorderRadius,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
                vertical: defaultPadding / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
