import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/views/food/add_to_card_screen.dart';
import 'package:food_app/widgets/app_colum.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controllers/populer_food_controller.dart';

class PopularFoodDetail extends StatelessWidget {
<<<<<<< HEAD
   const PopularFoodDetail({Key? key}) : super(key: key);
=======
  final int index;
  const PopularFoodDetail({Key? key, required this.index}) : super(key: key);
>>>>>>> food_api

  @override
  Widget build(BuildContext context) {
    final PopulerFoodController product = Get.put(PopulerFoodController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return Stack(children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppConstants.baseURL +
                              product.productList[index].img))),
                )),
            Positioned(
                top: 36.h,
                left: 20.w,
                right: 20.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const AppIcon(icon: Icons.arrow_back_ios)),
                    const AppIcon(icon: Icons.shopping_cart_outlined)
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
                        AppColum(text: product.productList[index].name),
                        SizedBox(height: 20.h),
                        const BigText(text: 'Introduct'),
                        SizedBox(height: 20.h),
                        Expanded(
                            child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                            text: product.productList[index].description,
                          ),
                        ))
                      ],
                    )))
          ]);
        }),
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
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.mainColor),
                  child: BigText(
                    text:
                        "\$ ${product.productList[index].price} | Add to cart",
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Get.to(const AddToCardScreen());
                },
              ),
            ],
          ),
        ));
  }
}
