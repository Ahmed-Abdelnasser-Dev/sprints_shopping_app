import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_card.dart';

class FeaturedProducts extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onAddToCart;

  const FeaturedProducts({
    required this.products,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: products.length,
        itemBuilder: (context, index) => Container(
          width: 180,
          margin: EdgeInsets.only(right: 16),
          child: ProductCard(
            product: products[index],
            onAddToCart: onAddToCart,
          ),
        ),
      ),
    );
  }
}
