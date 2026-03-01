import 'package:flame_labs/features/product_catalog/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text('Detail Produk', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.deepOrange),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,
                color: Colors.deepOrange),
            onPressed: () {
              print("Go to Cart Page!");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 370,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
              child: Text(
                '\$ ${product.price}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Text('${product.rating.rate} / 5.0'),
                  const SizedBox(width: 8),
                  Text('(${product.rating.count} reviews)'),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 10, bottom: 20),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(height: 10, color: Colors.grey.shade200),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description ?? 'Tidak ada deskripsi',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          children: [
            // Chat Icon (Dummy)
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                color: Colors.teal.shade50,
                child: const Icon(Icons.chat_outlined, color: Colors.teal),
              ),
            ),
            // Add to Cart Icon (Dummy)
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.black12)),
                  color: Colors.teal,
                ),
                child: IconButton(
                    onPressed: () {
                      print('go to page card');
                    },
                    icon: const Icon(Icons.add_shopping_cart,
                        color: Colors.white)),
              ),
            ),
            // Buy Now Button
            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                color: Colors.deepOrange,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      print('go to purchase page');
                    },
                    child: Text(
                      'Beli Sekarang',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
