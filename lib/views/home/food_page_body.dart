import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/controllers/populer_food_controller.dart';
import 'package:food_app/controllers/recomended_food_controller.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/views/food/popular_food_detail.dart';
import 'package:food_app/views/food/recomendded_food_detail.dart';
import 'package:food_app/widgets/app_colum.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_and_text_widget.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController pageController = PageController(viewportFraction: 0.85);
  final PopulerFoodController _product = Get.put(PopulerFoodController());
  final RecomendedFoodController _recoproduct =
      Get.put(RecomendedFoodController());
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220.h;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // *Slyder Section
        Obx(() {
          if (_product.isLoding.value) {
            return CircularProgressIndicator(
              color: AppColors.mainColor,
            );
          }
          return SizedBox(
            height: 320.h,
            child: PageView.builder(
                controller: pageController,
                itemCount: _product.productList.length,
                itemBuilder: (context, index) {
                  return _buildPageItems(index);
                }),
          );
        }),
        // *dots section
        // Obx(() {
        Obx(() {
          return DotsIndicator(
            dotsCount: _product.productList.length > 1
                ? _product.productList.length
                : 1,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        // }),
        SizedBox(height: 30.h),
        // *Populer Text
        Container(
          margin: EdgeInsets.only(left: 30.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BigText(text: "Recomended"),
              SizedBox(width: 10.w),
              Container(
                margin: EdgeInsets.only(bottom: 7.w),
                child: const BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: 10.w),
              const SmallText(
                text: 'Food pairing',
                color: Colors.black26,
              )
            ],
          ),
        ),
        Obx(() {
          if (_product.isLoding.value) {
            return CircularProgressIndicator(
              color: AppColors.mainColor,
            );
          }
          return ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: _recoproduct.productList.length,
              itemBuilder: (context, index) => GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 30.w, right: 30.w, top: 5.h, bottom: 5.h),
                      child: Row(
                        children: [
                          Container(
                            width: 120.w,
                            height: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.baseURL +
                                        _recoproduct.productList[index].img))),
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
                                  BigText(
                                      text:
                                          _recoproduct.productList[index].name),
                                  SizedBox(height: 7.h),
                                  const SmallText(
                                      text: 'With Chiness chracteistics'),
                                  SizedBox(height: 7.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        iconColor: AppColors.iconColor1,
                                        text: 'Normal',
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.location_on,
                                        iconColor: AppColors.mainColor,
                                        text: '1.7Km',
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        iconColor: AppColors.iconColor2,
                                        text: '32min',
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    onTap: () {
                      Get.to(RecomeddedFoodDetsil(
                        index: index,
                      ));
                    },
                  ));
        })
      ],
    );
  }

// buildPageItems
  Widget _buildPageItems(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return GestureDetector(
      child: Transform(
        transform: matrix,
        child: Obx(() {
          return Stack(
            children: [
              Container(
                height: _height,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: index.isEven ? Colors.blue : Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.baseURL +
                            _product.productList[index].img))),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120.h,
                  margin:
                      EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xffe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                        BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                      ]),
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: AppColum(text: _product.productList[index].name),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      onTap: () {
        Get.to(() => PopularFoodDetail(
              index: index,
            ));
      },
    );
  }
}
