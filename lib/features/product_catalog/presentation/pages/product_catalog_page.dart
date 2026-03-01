import 'package:flame_labs/features/product_catalog/presentation/bloc/product_bloc.dart';
import 'package:flame_labs/features/product_catalog/presentation/bloc/product_state.dart';
import 'package:flame_labs/features/product_catalog/presentation/widgets/product_grid.dart';
import 'package:flame_labs/features/product_catalog/presentation/widgets/shopee_app_bar.dart'; // NEW IMPORT!
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCatalogPage extends StatelessWidget {
  const ProductCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShopeeAppBar(),
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
