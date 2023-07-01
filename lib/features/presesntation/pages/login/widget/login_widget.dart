import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

void showLoading(BuildContext context){
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
void hideLoading(BuildContext context){
  Navigator.of(context).pop();
}