part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable{}

class ProductDetailStateInitial extends ProductDetailState {
  final int? id;

  ProductDetailStateInitial({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetProductDetailState extends ProductDetailState {
  @override
  List<Object> get props => [];
}

class ProductDetailStateLoading extends ProductDetailState{
  @override
  List<Object> get props => [];
}

class ProductDetailStateLoaded extends ProductDetailState{
  final ProductDetailResponseEntity? response;

  ProductDetailStateLoaded({required this.response});
  @override
  List<Object> get props =>[];
}

class ProductDetailStateError extends ProductDetailState{
  final Failure failure;

  ProductDetailStateError({required this.failure});

  @override
  List<Object> get props =>[];
}

