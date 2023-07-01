import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/utils/colors.dart';
import 'package:product_list/features/presesntation/pages/login/login_controller.dart';
import 'package:product_list/features/presesntation/widgets/loading_widget.dart';

import '../../../../di/injection_container.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/base_text_widget.dart';
import '../../widgets/build_button_widget.dart';
import '../../widgets/build_text_field_widget.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppbar("Login"),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Center(
                        child: reusableText(
                            "Enter your username and password to login"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText("Username"),
                              SizedBox(height: 8.h),
                              buildTextField("Enter your user name",
                                  TextFieldType.inputText, "user.png", (value) {
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginUsernameChanged(username: value));
                              }),
                              SizedBox(height: 15.h),
                              reusableText("Password"),
                              SizedBox(height: 8.h),
                              buildTextField("Enter your password",
                                  TextFieldType.password, "lock.png", (value) {
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginPasswordChanged(password: value));
                              }),
                              SizedBox(height: 70.h),
                              buildButton("Login", ButtonType.withBackground,
                                  () {
                                _showLoading();
                                LoginController(
                                        context: context, loginUseCase: sl())
                                    .handleLogin();
                              }),

                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  void _showLoading(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              padding: EdgeInsets.all(20.w),
              width: 200.w,
              height: 130.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Please Wait...", style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold),),
                  const CircularProgressIndicator(
                    color: AppColors.primaryElementStatus,
                  )
                ],
              ),
            ),
          );
        });
  }
}
