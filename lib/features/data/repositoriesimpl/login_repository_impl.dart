import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:product_list/features/data/datasource/login_remote_data_source.dart';
import 'package:product_list/features/data/model/login_model.dart';
import 'package:product_list/features/domain/entities/login_entities.dart';
import 'package:product_list/features/domain/repositories/login_repository.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failures.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    try {
      final loginRequest =
          LoginRequest(username: request.username, password: request.password);
      final response = await remoteDataSource.login(loginRequest);

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
  }
}

LoginResponseEntity _mapToResponseEntity(LoginResponse response) {
  return LoginResponseEntity(
    status: response.status,
    message: response.message,
    data: DataEntity(
      token: response.data?.token,
      user: UserEntity(
        id: response.data?.user?.id,
        username: response.data?.user?.username,
      )
    ),
  );
}
