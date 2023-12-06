import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/core/managers/images.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';

class ProductTopWidget extends StatelessWidget {
  final LaptopModel laptop;
  const ProductTopWidget({
    super.key,
    required this.laptop,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
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
                    fontSize: 14.sp,
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
                width: 170.h,
                height: 170.h,
              ),
              CachedNetworkImage(
                imageUrl: laptop.image ?? "",
                width: 170.h,
                height: 170.h,
              ),

              Positioned(
                top: 10.h,
                right: 10.h,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 28.h,
                    height: 28.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColorLight,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_outline,
                        size: 20.sp,
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
