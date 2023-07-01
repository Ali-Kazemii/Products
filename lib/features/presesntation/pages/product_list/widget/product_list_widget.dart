import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/utils/constant.dart';
import 'package:product_list/features/domain/entities/home_entities.dart';
import 'package:product_list/global.dart';

import '../../../../../core/routes/names.dart';
import '../../../../../core/utils/colors.dart';
import '../../../widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Center(
      child: reusableText("Product List"),
    ),
    backgroundColor: AppColors.appbar,
  );
}

//reusable big text widget
Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildProductList(
    {required BuildContext context, required ProductListResponseEntity? list}) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: CustomScrollView(slivers: [
        SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 18.h),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1.6,
              ),
              delegate: SliverChildBuilderDelegate(
                  childCount: list?.listItem?.length, (context, index) {
                return GestureDetector(
                    onTap: () {
                      Global.storageService.setInt(AppConstants.STORAGE_PRODUCT_ID_KEY, list?.listItem?[index].id);
                      Navigator.of(context)
                          .pushNamed(AppRoutes.PRODUCT_DETAIL_PAGE);
                    },
                    child: _productListGrid(item: list?.listItem?[index]));
              }),
            ))
      ]));
}

//for product grid view ui
Widget _productListGrid({
  required ItemEntity? item,
}) {
  return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryElementStatus),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _getImageFromUrl(imageUrl: item?.image)),
          SizedBox(height: 20.h),
          Center(
              child: Text(
            item?.title ?? "no title",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp),
          ))
        ],
      ));
}

Widget _getImageFromUrl({String? imageUrl}) {
  return Image.network(
    width: 100.w,
    height: 200.h,
    imageUrl!,
    fit: BoxFit.scaleDown,
    errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Image.asset(
        "assets/icons/no_image.png",
        width: 100.w,
        fit: BoxFit.contain,
      );
    },
  );
}
