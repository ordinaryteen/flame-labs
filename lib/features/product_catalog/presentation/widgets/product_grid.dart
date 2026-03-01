import 'package:flame_labs/features/product_catalog/domain/entities/product_entity.dart';
import 'package:flame_labs/features/product_catalog/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: state.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemBuilder: (context, index) {
          final singleProduct = state.products[index];

          return ProductCard(product: singleProduct);
        });
  }
}
