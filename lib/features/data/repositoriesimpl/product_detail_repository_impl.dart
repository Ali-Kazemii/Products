import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:product_list/features/data/datasource/product_detail_remote_data_source.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/product_detail_entities.dart';
import '../../domain/repositories/product_detail_repository.dart';
import '../model/product_detail_model.dart';

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  final ProductDetailRemoteDataSource remoteDataSource;
  ProductDetailRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ProductDetailResponseEntity>> getProductDetail(
      ProductDetailRequestEntity request) async{
    try {
      final response = await remoteDataSource.getProductDetail(
          ProductDetailRequest(id: request.id)
      );
      print("product detail response message:${response.message}");
      return right(_mapToResponseEntity(response));

    } on ServerException catch (_) {
      debugger();
      return left(ServerFailure());
    } on InternetException catch (_) {
      debugger();
      return left(SocketFailure());
    } on AuthenticationException catch (_) {
      debugger();
      return left(AuthenticationFailure());
    } catch (e) {
      debugger();
      return left(UnexpectedFailure());
    }
  }
}

ProductDetailResponseEntity _mapToResponseEntity(ProductDetailResponse response){
  return ProductDetailResponseEntity(
    status: response.status,
    message: response.message,
    data: DataEntity(
      id: response.data?.id,
      title: response.data?.title,
      image: response.data?.image
    )
  );
}
