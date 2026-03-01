import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> getSingleProduct(int id);
}
