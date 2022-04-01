import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:shamo/features/product/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductUsecase getProductUsecase;
  final GetPopularProductUsecase getPopularProductUsecase;
  ProductCubit(
      {required this.getProductUsecase, required this.getPopularProductUsecase})
      : super(ProductInitial());
  int page = 0;

  Future<void> getProduct() async {
    emit(OnProductLoading());
    page += 1;
    final result = await getProductUsecase.call(page);

    result.fold((failures) {
      emit(OnProductError(errorMessage: failures));
    }, (response) {
      emit(OnProductLoaded(productModel: response));
    });
  }

  Future<void> initialStateProduct() async {
    page = 0;
    emit(ProductInitial());
    emit(PopularProductInitial());
  }

  Future<void> getPopularProduct() async {
    emit(OnPopularProductLoading());
    final result = await getPopularProductUsecase.call(1);
    result.fold((failures) {
      emit(OnPopularProductError(errorMessage: failures));
    }, (response) {
      emit(OnPopularProductLoaded(productModel: response));
    });
  }
}
