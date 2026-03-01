class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String? description;
  final String? category;
  final String image;
  final double? originalPrice;
  final Rating rating;

  ProductEntity(
      {required this.id,
      required this.title,
      required this.price,
      this.description,
      this.category,
      required this.image,
      this.originalPrice,
      required this.rating});

  ProductEntity copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    double? originalPrice,
    Rating? rating,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      originalPrice: originalPrice ?? this.originalPrice,
      rating: rating ?? this.rating,
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
