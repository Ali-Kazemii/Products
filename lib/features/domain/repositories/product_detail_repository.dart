import 'package:dartz/dartz.dart';
import 'package:product_list/features/domain/entities/product_detail_entities.dart';

import '../../../core/error/failures.dart';

abstract class ProductDetailRepository {
  Future<Either<Failure, ProductDetailResponseEntity>> getProductDetail(ProductDetailRequestEntity request);
}
