import 'package:flame_labs/features/product_catalog/domain/entities/product_entity.dart';
import 'package:flame_labs/features/product_catalog/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // We pass the product object directly into the next screen!
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 2. THE TEXT & PRICE
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  // PRICE
                  Text(
                    "\$ ${product.price}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
