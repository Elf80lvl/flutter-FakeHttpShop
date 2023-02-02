import 'package:flutter/material.dart';

import '../../widgets/product_card.dart';

class MobileHomeLayout extends StatelessWidget {
  const MobileHomeLayout({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            title: products[index].title,
            description: products[index].description,
            price: products[index].price,
            discountPercentage: products[index].discountPercentage,
            rating: products[index].rating,
            stock: products[index].stock,
            thumbnail: products[index].thumbnail,
          );
        });
  }
}
