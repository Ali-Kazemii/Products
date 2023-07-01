import 'package:dartz/dartz.dart';
import 'package:product_list/core/usecase/usecase.dart';
import 'package:product_list/features/domain/repositories/login_repository.dart';

import '../../../core/error/failures.dart';
import '../entities/login_entities.dart';

class LoginUseCase implements UseCase<LoginRequestEntity, LoginResponseEntity> {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, LoginResponseEntity>> call(
      LoginRequestEntity request) async {
    return loginRepository.login(request);
  }
}
