import 'package:flame_labs/features/product_catalog/presentation/bloc/product_bloc.dart';
import 'package:flame_labs/features/product_catalog/presentation/bloc/product_event.dart';
import 'package:flame_labs/features/product_catalog/presentation/pages/product_catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flame_labs/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const ShopeeApp());
}

class ShopeeApp extends StatelessWidget {
  const ShopeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopee Lite',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(248, 255, 255, 255),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => di.sl<ProductBloc>()..add(GetProductEvent()),
        child: const ProductCatalogPage(),
      ),
    );
  }
}
