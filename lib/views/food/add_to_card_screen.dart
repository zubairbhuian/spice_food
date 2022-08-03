import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/views/home/main_food_page.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../widgets/small_text.dart';

class AddToCardScreen extends StatelessWidget {
  const AddToCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: AppIcon(
                icon: Icons.arrow_back_ios,
                bgColor: AppColors.mainColor,
                iconColor: Colors.white,
              ),
              onTap: () {
                Get.back();
              },
            ),
            Row(
              children: [
                GestureDetector(
                  child: AppIcon(
                      icon: Icons.home,
                      bgColor: AppColors.mainColor,
                      iconColor: Colors.white),
                  onTap: () {
                    Get.offAll(const MainFooodPage());
                  },
                ),
                SizedBox(width: 40.w),
                Stack(
                  children: [
                    AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        bgColor: AppColors.mainColor,
                        iconColor: Colors.white),
                    const Positioned(
                        top: -1,
                        right: 2,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child: BigText(
                            color: Colors.white,
                            text: "2",
                            size: 12,
                          ),
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(
                    left: 30.w, right: 30.w, top: 5.h, bottom: 5.h),
                child: Row(
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: const Color.fromARGB(255, 241, 241, 241),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/food_page_body1_naw.jpg'))),
                    ),
                    Expanded(
                        child: Container(
                      height: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const BigText(text: "fsfsd"),
                            SizedBox(height: 7.h),
                            const SmallText(text: 'With Chiness chracteistics'),
                            SizedBox(height: 7.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BigText(
                                  text: "\$ 33.0",
                                  color: Colors.red,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          167, 236, 236, 236),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
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
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )),
    );
  }
}
