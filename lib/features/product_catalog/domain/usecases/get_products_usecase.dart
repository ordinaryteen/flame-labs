import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  // function "call" can run the class
  // exactly like a function: e.g., getProductsUseCase()
  Future<List<ProductEntity>> call() async {
    return await repository.getProducts();
  }
}
