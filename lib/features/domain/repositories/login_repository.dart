import 'package:dartz/dartz.dart';
import 'package:product_list/core/error/failures.dart';

import '../entities/login_entities.dart';

abstract class LoginRepository{
  Future<Either<Failure, LoginResponseEntity>> login(LoginRequestEntity request);
}