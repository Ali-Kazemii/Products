class ProductDetailRequest{
  final int? id;
  ProductDetailRequest({required this.id});
}

class ProductDetailResponse {
  final String? status;
  final Data? data;
  final String? message;

  ProductDetailResponse({
    this.status,
    this.data,
    this.message,
  });

  factory ProductDetailResponse.fromJson(dynamic json) {
    return ProductDetailResponse(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
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
    this.image,
  });

  factory Data.fromJson(dynamic json) {
    return Data(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
