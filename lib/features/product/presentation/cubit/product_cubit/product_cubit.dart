import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:shamo/features/product/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductUsecase getProductUsecase;

  ProductCubit({required this.getProductUsecase}) : super(ProductInitial());
  int page = 0;
  int? categories;

  Future<void> getProduct({int? pages, int? category}) async {
    emit(OnProductLoading());
    page += 1;
    categories = category ?? categories;
    final result = await getProductUsecase.call(page, categories);

    result.fold((failures) {
      emit(OnProductError(errorMessage: failures));
    }, (response) {
      emit(OnProductLoaded(productModel: response));
    });
  }

  Future<void> initialStateProduct({int? category}) async {
    page = 0;
    categories = category;
    emit(ProductInitial());
  }
}
