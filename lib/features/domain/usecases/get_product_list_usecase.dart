import 'package:dartz/dartz.dart';
import 'package:product_list/features/domain/entities/home_entities.dart';
import 'package:product_list/features/domain/repositories/home_repository.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';

class GetProductListUseCase implements SingleUseCase<ProductListResponseEntity> {
  final HomeRepository homeRepository;

  GetProductListUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, ProductListResponseEntity>> call() {
    return homeRepository.getProductList();
  }
}
