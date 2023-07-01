import 'package:equatable/equatable.dart';

class ProductListResponse with EquatableMixin {

  String? status;
  List<Data>? data;
  String? message;

  @override
  List<Object?> get props => [];

  ProductListResponse({
    this.status,
    this.data,
    this.message,
  });

  factory ProductListResponse.fromJson(dynamic json) {
    var data = <Data>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
   return ProductListResponse(
     status:  json['status'],
     data: data,
    message:  json['message']
   );
  }
}


class Data {
  final int? id;
final String? title;
final String? image;
  Data({
    this.id,
    this.title,
    this.image,});

  factory Data.fromJson(dynamic json) {
   return Data(
       id : json['id'],
       title : json['title'],
       image : json['image'],
   );
  }
}