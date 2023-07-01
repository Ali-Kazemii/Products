
import 'package:equatable/equatable.dart';

class LoginRequest{
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}

class LoginResponse with EquatableMixin {
  final String? status;
  final Data? data;
  final String? message;

  LoginResponse({this.status, this.data, this.message});

  @override
  List<Object?> get props => [data];

  factory LoginResponse.fromJson(Map<String?, dynamic> json) {
    return LoginResponse(
        status: json['status'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
        message: json['message']);
  }
}

class Data {
  final User? user;
  final String? token;

  Data({this.user, this.token});

  factory Data.fromJson(dynamic json) {
    return Data(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class User {
  final int? id;
  final String? username;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  User({
    this.id,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'],
      username: json['username'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
