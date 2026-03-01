import 'dart:math';
import '../entities/product_entity.dart';

class GetFlashSaleProductsUsecase {
  List<ProductEntity> call(List<ProductEntity> allProducts) {
    final random = Random();
    final flashSaleCount = random.nextInt(4) + 2;

    final shuffledList = List.of(allProducts)..shuffle(random);

    final pickedItems = shuffledList.take(flashSaleCount).toList();

    return pickedItems.map((oldProduct) {
      final discountMultiplier = (random.nextDouble() * 0.3) + 0.5;

      return oldProduct.copyWith(
        originalPrice: oldProduct.price,
        price: double.parse(
            (oldProduct.price * discountMultiplier).toStringAsFixed(2)),
      );
    }).toList();
  }
}
