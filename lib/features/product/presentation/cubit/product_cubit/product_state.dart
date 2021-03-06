part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class OnProductLoading extends ProductState {}

class OnProductLoaded extends ProductState {
  final ListProductModel? productModel;
  const OnProductLoaded({this.productModel});

  @override
  List<Object> get props => [productModel!];
}

class OnProductError extends ProductState {
  final Failures? errorMessage;
  const OnProductError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage!];
}
