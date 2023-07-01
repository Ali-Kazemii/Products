part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable{}

class ProductListStateInitial extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductListStateLoading extends ProductListState{
  @override
  List<Object?> get props => [];
}

class ProductListStateLoaded extends ProductListState{
  final ProductListResponseEntity? response;

  ProductListStateLoaded({required this.response});
  @override
  List<Object> get props =>[];
}

class ProductListStateError extends ProductListState{
  final Failure failure;

  ProductListStateError({required this.failure});

  @override
  List<Object> get props =>[];
}

