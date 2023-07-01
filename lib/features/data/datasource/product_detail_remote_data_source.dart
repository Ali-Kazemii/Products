import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/error/exception.dart';
import '../../../global.dart';
import '../model/product_detail_model.dart';

abstract class ProductDetailRemoteDataSource {
  Future<ProductDetailResponse> getProductDetail(ProductDetailRequest request);
}

class ProductDetailRemoteDataSourceImpl
    implements ProductDetailRemoteDataSource {
  final Dio dio;

  ProductDetailRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductDetailResponse> getProductDetail(
    ProductDetailRequest request,
  ) async {
    try {
      Response response = await dio.get(
          "products/show/${request.id}",
          queryParameters: {"id": request.id},
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${Global.storageService.getUserToken()} ',
            },
          ));

      var statusCode = response.statusCode;
      if (statusCode != null && statusCode >= 200 && statusCode < 300) {
        return ProductDetailResponse.fromJson(response.data);
      } else {
        debugger();
        throw ExceptionUtils.dioStatusCodeErrorHandle(response.statusCode);
      }
    } on DioException catch (e, stacktrace) {
      debugger();
      print("remote error: ${e} ${stacktrace}");
      throw ExceptionUtils.dioErrorHandle(e, stacktrace);
    }
  }
}
