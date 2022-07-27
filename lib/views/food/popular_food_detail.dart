import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/app_colum.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/images/food_page_body7.jpg'))),
              )),
          Positioned(
              top: 45.h,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 300.h - 20,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppColum(text: 'Chiness Side'),
                      SizedBox(height: 20.h),
                      const BigText(text: 'Introduct'),
                      SizedBox(height: 20.h),
                      const Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase'),
                        ),
                      )
                    ],
                  )))
        ]),
        bottomNavigationBar: Container(
          height: 100.h,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    Icon(
                      Icons.remove,
                      color: AppColors.singColor,
                    ),
                    SizedBox(width: 5.w),
                    const BigText(text: "0"),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.add,
                      color: AppColors.singColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.mainColor),
                child: const BigText(
                  text: "\$20 | Add to cart",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
