part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable{}

class ProductListEventInitial extends ProductListEvent{
  ProductListEventInitial();

  @override
  List<Object> get props =>[];
}