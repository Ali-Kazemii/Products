import 'package:equatable/equatable.dart';

class LoginRequestEntity {
  final String username;
  final String password;

  const LoginRequestEntity({
    this.username = "",
    this.password = "",
  });
}

class LoginResponseEntity extends Equatable {

  final String? status;
  final DataEntity? data;
  final String? message;

  @override
  List<Object?> get props => [data];

  const LoginResponseEntity({
    this.status,
    this.data,
    this.message,});
}

class DataEntity {

  final UserEntity? user;
  final String? token;

  const DataEntity({
    this.user,
    this.token,});
}


class UserEntity {

  final String? username;
  final String? updatedAt;
  final String? createdAt;
  final String? deletedAt;
  final int? id;

  const UserEntity({
    this.id,
    this.username,
    this.updatedAt,
    this.createdAt,
    this.deletedAt,
  });
}


