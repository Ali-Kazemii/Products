import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:product_list/features/data/model/home_model.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/home_entities.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasource/product_list_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ProductListRemoteDataSource remoteDataSource;

  // final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ProductListResponseEntity>> getProductList() async {
    // if (await networkInfo.isConnected) {
    try {
      final response = await remoteDataSource.getProductList();
      print("response message:${response.message}");
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
    /*} else {
      return left(SocketFailure());
    }*/
  }
}

ProductListResponseEntity _mapToResponseEntity(ProductListResponse response) {
  return ProductListResponseEntity(
      status: response.status,
      message: response.message,
      listItem: _mapToListData(response.data));
}

List<ItemEntity> _mapToListData(List<Data>? listData) {
  var list = <ItemEntity>[];
  if (listData == null || listData.isEmpty) {
    return list;
  } else {
    for (var value in listData) {
      list.add(
          ItemEntity(id: value.id, title: value.title, image: value.image));
    }
    return list;
  }
}
