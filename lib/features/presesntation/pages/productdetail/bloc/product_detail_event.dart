part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {}

class ProductDetailEventInitial extends ProductDetailEvent {
  final int? id;

  ProductDetailEventInitial({this.id});

  @override
  List<Object?> get props => [id];
}

class GetProductDetailEvent extends ProductDetailEvent {
  @override
  List<Object> get props => [];
}