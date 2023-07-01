import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';


abstract class UseCase<Type, Params>{
  Future<Either<Failure, Params>> call(Type request);
}
abstract class SingleUseCase<Params>{
  Future<Either<Failure, Params>> call();
}
abstract class NoParams extends Equatable {}
