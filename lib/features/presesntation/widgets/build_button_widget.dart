import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

enum ButtonType { withBackground, justBorder }

Widget buildButton(String buttonName, ButtonType buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin:
          EdgeInsets.only(top: buttonType == ButtonType.withBackground ? 30.h : 12.h),
      decoration: BoxDecoration(
        color: buttonType == ButtonType.withBackground
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          //check for registration button border color
            color: buttonType == ButtonType.withBackground
                ? AppColors.primaryElementStatus
                : AppColors.primaryText),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
