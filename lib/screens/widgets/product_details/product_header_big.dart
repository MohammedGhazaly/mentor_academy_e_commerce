import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';

class ProductHeaderBig extends StatelessWidget {
  final LaptopModel laptop;
  final int index;
  const ProductHeaderBig({
    super.key,
    required this.laptop,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Hero(
            tag: "${laptop.sId}status",
            child: RotatedBox(
              quarterTurns: 1,
              child: Container(
                color: AppColors.primaryColorDark,
                // width: 150.h,
                // height: 30.w,
                child: Center(
                  child: Text(
                    laptop.status ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Container(
                color: AppColors.primaryColor,
                width: 310.h,
                height: 310.h,
              ),
              Hero(
                tag: laptop.sId ?? "",
                child: CachedNetworkImage(
                  imageUrl: laptop.images?[index] ?? "",
                  width: 310.h,
                  height: 310.h,
                ),
              ),
              if (laptop.sales != 0)
                Positioned(
                  bottom: 25,
                  right: 0,
                  child: Hero(
                    tag: "${laptop.sId}off",
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${laptop.sales}% off",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 40.h,
                right: 30.h,
                child: InkWell(
                  onTap: () {},
                  child: Hero(
                    tag: "${laptop.sId}icon",
                    child: Container(
                      width: 40.h,
                      height: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColorLight,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite_outline,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              // Text("Test")
            ],
          ),
        ),
      ],
    );
  }
}
