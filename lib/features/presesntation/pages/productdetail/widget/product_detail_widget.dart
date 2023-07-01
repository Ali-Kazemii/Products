import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/features/domain/entities/product_detail_entities.dart';

import '../../../../../core/utils/colors.dart';
import '../../../widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Center(
      child: reusableText("Product Detail"),
    ),
      backgroundColor: AppColors.appbar
  );
}

Widget buildProductDetail({
  required BuildContext context,
  required ProductDetailResponseEntity? response,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 25.w),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30.h),
          Center(
            child: Text(
              response?.data?.title ?? "no title",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: _getImageFromUrl(imageUrl: response?.data?.image)),
          ),
        ],
      ),
  );
}

Widget _getImageFromUrl({String? imageUrl}) {
  return Image.network(
    imageUrl!,
    fit: BoxFit.cover,
    errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Image.asset(
        "assets/icons/no_image.png",
        width: 300.w,
        fit: BoxFit.contain,
      );
    },
  );
}
