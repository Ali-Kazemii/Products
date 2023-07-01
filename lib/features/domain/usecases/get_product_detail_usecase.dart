import 'package:dartz/dartz.dart';
import 'package:product_list/core/usecase/usecase.dart';
import 'package:product_list/features/domain/entities/product_detail_entities.dart';
import 'package:product_list/features/domain/repositories/product_detail_repository.dart';

import '../../../core/error/failures.dart';

class GetProductDetailUseCase
    implements
        UseCase<ProductDetailRequestEntity, ProductDetailResponseEntity> {
  final ProductDetailRepository productDetailRepository;

  GetProductDetailUseCase({required this.productDetailRepository});

  @override
  Future<Either<Failure, ProductDetailResponseEntity>> call(
      ProductDetailRequestEntity request) {
    return productDetailRepository.getProductDetail(request);
  }
}
