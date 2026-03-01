import 'package:flame_labs/features/product_catalog/data/datasources/product_remote_data_source.dart';
import 'package:flame_labs/features/product_catalog/data/repositories/product_repository_impl.dart'; // IMPORTANT IMPORT!
import 'package:flame_labs/features/product_catalog/domain/repositories/product_repository.dart';
import 'package:flame_labs/features/product_catalog/domain/usecases/get_products_usecase.dart';
import 'package:flame_labs/features/product_catalog/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOC
  sl.registerFactory(() => ProductBloc(getProductsUseCase: sl()));

  // USE CASES
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));

  // REPOSITORY
  // The UI asks for the Contract (ProductRepository).
  // We use () => to return the IMPLEMENTATION (ProductRepositoryImpl).
  // The Impl needs the remote data source, so we put sl() inside of it!
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));

  // DATA SOURCES
  // The Repo asks for the Contract (ProductRemoteDataSource).
  // We use () => to return the IMPLEMENTATION (ProductRemoteDataSourceImpl).
  // The Impl needs Dio, so we put sl() inside of it!
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(dio: sl()));

  // --- CORE RESOURCES ---

  // EXTERNAL PACKAGES
  sl.registerLazySingleton(() => Dio());
}
