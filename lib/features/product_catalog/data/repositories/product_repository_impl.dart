import 'package:flame_labs/features/product_catalog/data/datasources/product_remote_data_source.dart';
import 'package:flame_labs/features/product_catalog/domain/entities/product_entity.dart';
import 'package:flame_labs/features/product_catalog/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductEntity>> getProducts() async {
    return remoteDataSource.getProducts();
  }

  @override
  Future<ProductEntity> getSingleProduct(int id) {
    throw UnimplementedError();
  }
}
