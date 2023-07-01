import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:product_list/features/data/model/login_model.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/endpoints.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;
  LoginRemoteDataSourceImpl({required this.dio});

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      Response response = await dio.post(
        EndPointConfig.loginUrl,
        data: request.toJson(),
      );
      print("remote response data: ${response.data.toString()}");
      var statusCode = response.statusCode;
      if (statusCode != null && statusCode >= 200 && statusCode < 300) {
        return LoginResponse.fromJson(response.data);
        // return LoginResponse.fromJson(json.decode(json['data']));
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
