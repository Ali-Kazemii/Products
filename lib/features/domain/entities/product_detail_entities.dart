class ProductDetailRequestEntity{
  final int? id;

  ProductDetailRequestEntity({this.id});

}

class ProductDetailResponseEntity {
  final String? status;
  final DataEntity? data;
  final String? message;

  ProductDetailResponseEntity({
    this.status,
    this.data,
    this.message,
  });
}

class DataEntity{
  final int? id;
  final String? title;
  final String? image;

  DataEntity({
    this.id,
    this.title,
    this.image,
  });
}