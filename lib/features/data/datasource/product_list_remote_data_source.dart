import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:product_list/core/network/endpoints.dart';
import 'package:product_list/global.dart';

import '../../../core/error/exception.dart';
import '../model/home_model.dart';

abstract class ProductListRemoteDataSource {
  Future<ProductListResponse> getProductList();
}

class ProductListRemoteDataSourceImpl implements ProductListRemoteDataSource {
  final Dio dio;

  ProductListRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductListResponse> getProductList() async {
    try {
      Response response = await dio.get(EndPointConfig.listProductUrl,
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${Global.storageService.getUserToken()} ',
            },
          ));

      var statusCode = response.statusCode;
      if (statusCode != null && statusCode >= 200 && statusCode < 300) {
        return ProductListResponse.fromJson(response.data);
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
