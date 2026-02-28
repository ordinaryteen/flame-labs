import 'package:flame_labs/core/constants/api_constants.dart';
import 'package:flame_labs/features/product_catalog/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flame_labs/core/error/exceptions.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getSingleProduct(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;
  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('$kBaseUrl/products');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((jsonItem) => ProductModel.fromJson(jsonItem))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getSingleProduct(int id) async {
    throw UnimplementedError();
  }
}
