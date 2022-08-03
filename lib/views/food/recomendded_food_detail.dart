import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/views/food/add_to_card_screen.dart';
import 'package:food_app/views/home/main_food_page.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controllers/recomended_food_controller.dart';
import '../../utils/app_constants.dart';

class RecomeddedFoodDetsil extends StatelessWidget {
  final int index;
  const RecomeddedFoodDetsil({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecomendedFoodController recoproduct =
        Get.put(RecomendedFoodController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return CustomScrollView(slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const AppIcon(icon: Icons.clear),
                  onTap: () {
                    Get.to(const MainFooodPage());
                  },
                ),
                const AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  // margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r))),
                  child: Center(
                      child: BigText(
                    text: recoproduct.productList[index].name,
                    size: 26.sp,
                  )),
                )),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  AppConstants.baseURL + recoproduct.productList[index].img),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: ExpandableTextWidget(
                    text: recoproduct.productList[index].description),
              )
            ],
          ))
        ]);
      }),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: 20,
                  size: 50,
                ),
                BigText(
                  text: " ${recoproduct.productList[index].price} X 0 ",
                  color: AppColors.mainBlackColor,
                  size: 26.sp,
                ),
                AppIcon(
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: 20,
                  size: 50,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
                          "\$ ${recoproduct.productList[index].price} | Add to cart",
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Get.to(const AddToCardScreen());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
