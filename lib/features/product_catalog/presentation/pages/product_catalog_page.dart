import 'package:flame_labs/features/product_catalog/domain/entities/product_entity.dart';
import 'package:flame_labs/features/product_catalog/presentation/bloc/product_bloc.dart';
import 'package:flame_labs/features/product_catalog/presentation/bloc/product_state.dart';
import 'package:flame_labs/features/product_catalog/presentation/widgets/product_card.dart'; // IMPORT THIS!
import 'package:flame_labs/features/product_catalog/presentation/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCatalogPage extends StatelessWidget {
  final ProductEntity products;
  const ProductCatalogPage({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        toolbarHeight: 60.0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Cari di Shopee Lite...',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              print("Go to Cart Page!");
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        // Loaded
        else if (state is ProductLoaded) {
          return ProductGrid(products: state.products);
        }
        // Error
        else if (state is ProductError) {
          return Center(
            child:
                Text(state.message, style: const TextStyle(color: Colors.red)),
          );
        }

        return const Center(
          child: Text('Menunggu data...'),
        );
      }),
    );
  }
}
