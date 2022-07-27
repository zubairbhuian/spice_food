import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';

class RecomeddedFoodDetsil extends StatelessWidget {
  const RecomeddedFoodDetsil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          toolbarHeight: 70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppIcon(icon: Icons.clear),
              AppIcon(icon: Icons.shopping_cart_outlined),
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
                  text: 'Chiness Side',
                  size: 26.sp,
                )),
              )),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
                width: double.maxFinite,
                fit: BoxFit.cover,
                'assets/images/food_page_body8.jpg'),
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: const ExpandableTextWidget(
                  text:
                      "Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebaseFlutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebaseFlutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase"),
            )
          ],
        ))
      ]),
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
                  text: "\$12.34 X 0 ",
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
          )
        ],
      ),
    );
  }
}
