import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/domain/usecases/login_usecase.dart';
import 'package:product_list/features/presesntation/widgets/flutter_toast.dart';

import '../../../../core/routes/names.dart';
import '../../../../core/utils/constant.dart';
import '../../../../global.dart';
import '../../../domain/entities/login_entities.dart';
import 'bloc/login_bloc.dart';

class LoginController {
  final BuildContext context;
  final LoginUseCase loginUseCase;

  const LoginController({required this.context, required this.loginUseCase});

  void handleLogin() async {
    try {
      final state = context.read<LoginBloc>().state;
      String? username = state.username;
      String? password = state.password;

      if (username.length >= 3 &&
          username.length < 20 &&
          password.length >= 8) {
        final result = await loginUseCase
            .call(LoginRequestEntity(username: username, password: password));
        result.fold((failure) {
          debugger();
          print("failure:$failure");
          toastInfo(msg: failure.getMessage().toString());
        }, (entity) {
          print("Success login: ${entity.data?.token}");
          Global.storageService.setString(
              AppConstants.STORAGE_USER_TOKEN_KEY, entity.data?.token);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.PRODUCT_LIST_PAGE, (route) => false);
        });
      } else if (username.toString().isEmpty ||
          username.toString().length < 3 ||
          username.toString().length > 20) {
        toastInfo(
            msg:
                "Invalid userName.. username should be between 3 to 20 character");
      } else if (password.toString().isEmpty ||
          password.toString().length < 8) {
        toastInfo(
            msg:
                "Invalid password.. password should be grater than 8 character");
      }
    } catch (e) {
      print(e);
      toastInfo(msg: e.toString());
    }
  }
}
