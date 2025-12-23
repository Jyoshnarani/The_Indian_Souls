import 'package:flutter/material.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.title,
    // required this.price,
    // required this.color,
    // required this.size,
    required this.desc,
  });

  final String title,desc;// price, color, size,

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(defaultPadding),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Size: $size",
            //   style: const TextStyle(fontWeight: FontWeight.w500),
            // ),
            // const SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // const SizedBox(height: defaultPadding),
                // Text(
                //   "\$$price",
                //   style: Theme.of(
                //     context,
                //   ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                // ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            SizedBox(height: 10,),
            Text(
              "Description: $desc",
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: defaultPadding / 2),
            SizedBox(height: 10,),
            // Text("Color: $color", style: const TextStyle(height: 1.4)),
            // const SizedBox(height: defaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
