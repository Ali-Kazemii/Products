import 'package:dartz/dartz.dart';
import 'package:product_list/core/error/failures.dart';

import '../entities/home_entities.dart';

abstract class HomeRepository{
  Future<Either<Failure, ProductListResponseEntity>> getProductList();
}