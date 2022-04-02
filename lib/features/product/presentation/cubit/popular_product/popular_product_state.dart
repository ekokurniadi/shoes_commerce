part of 'popular_product_cubit.dart';

abstract class PopularProductState extends Equatable {
  const PopularProductState();

  @override
  List<Object> get props => [];
}

class PopularProductInitial extends PopularProductState {}

class OnPopularProductLoading extends PopularProductState {}

class OnPopularProductLoaded extends PopularProductState {
  final ListProductModel? productModel;
  const OnPopularProductLoaded({this.productModel});

  @override
  List<Object> get props => [productModel!];
}

class OnPopularProductError extends PopularProductState {
  final Failures? errorMessage;
  const OnPopularProductError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage!];
}
