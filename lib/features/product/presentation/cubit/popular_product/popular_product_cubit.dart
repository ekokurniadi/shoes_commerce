import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/core/error/failures.dart';
import 'package:shamo/features/product/product.dart';

part 'popular_product_state.dart';

class PopularProductCubit extends Cubit<PopularProductState> {
  final GetPopularProductUsecase getPopularProductUsecase;
  PopularProductCubit({required this.getPopularProductUsecase})
      : super(PopularProductInitial());
  int? categories;

  Future<void> getPopularProduct(int? category) async {
    categories = category ?? categories;

    emit(OnPopularProductLoading());
    final result = await getPopularProductUsecase.call(1, categories);
    result.fold((failures) {
      emit(OnPopularProductError(errorMessage: failures));
    }, (response) {
      emit(OnPopularProductLoaded(productModel: response));
    });
  }

  Future<void> initialStatePopularProduct({int? category}) async {
    categories = category;
    emit(PopularProductInitial());
  }
}
