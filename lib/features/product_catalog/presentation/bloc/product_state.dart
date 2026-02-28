import 'package:flame_labs/features/product_catalog/domain/entities/product_entity.dart';

sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  ProductLoaded({required this.products});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
