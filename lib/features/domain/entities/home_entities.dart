import 'package:equatable/equatable.dart';

class ProductListResponseEntity extends Equatable {

  final String? status;
  final List<ItemEntity>? listItem;
  final String? message;

  const ProductListResponseEntity({this.status, this.listItem, this.message});

  @override
  List<Object?> get props =>[listItem];
}

class ItemEntity {
  final int? id;
  final String? title;
  final String? image;

  const ItemEntity({this.id, this.title, this.image});
}