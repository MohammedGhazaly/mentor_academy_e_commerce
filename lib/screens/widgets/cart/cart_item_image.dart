import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              children: [
                Container(
                  height: 110.h,
                  width: 110.h,
                  color: AppColors.primaryColorDark,
                ),
                Image.asset(
                  "assets/images/laptop_test.png",
                  height: 110.h,
                  width: 110.h,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 110.h,
                    // height: 25.h,
                    // padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                    ),
                    child: Center(
                      child: Text(
                        "15% off",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
