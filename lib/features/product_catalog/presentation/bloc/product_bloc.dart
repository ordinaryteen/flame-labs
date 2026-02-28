import 'package:bloc/bloc.dart';
import 'package:flame_labs/core/error/exceptions.dart';
import 'package:flame_labs/features/product_catalog/domain/usecases/get_products_usecase.dart';
import 'package:flame_labs/features/product_catalog/presentation/bloc/product_event.dart';
import 'package:flame_labs/features/product_catalog/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductBloc({required this.getProductsUseCase}) : super(ProductInitial()) {
    on<GetProductEvent>(_onGetProducts);
  }

  Future<void> _onGetProducts(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    try {
      final productsList = await getProductsUseCase();

      emit(ProductLoaded(products: productsList));
    } on ServerException {
      emit(ProductError(message: "Gagal mengambil data dari server."));
    }
  }
}
