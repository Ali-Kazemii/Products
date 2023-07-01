import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../widgets/base_text_widget.dart';

AppBar buildAppbar(){
  return AppBar(
    backgroundColor: AppColors.appbar,
    title: Container(
      child: Container(
        child: Center(
          child: reusableText("Settings"),
        ),
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func){
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm logout"),
              content: Text("Do you confirm logout?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: func,
                    child: Text("Confirm")),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}