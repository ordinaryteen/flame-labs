import 'package:flame_labs/features/product_catalog/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    super.description,
    super.category,
    required super.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
    );
  }
}
