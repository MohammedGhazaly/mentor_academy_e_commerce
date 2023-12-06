import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';

class ProductBottomWidget extends StatelessWidget {
  final LaptopModel laptop;
  const ProductBottomWidget({
    super.key,
    required this.laptop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightColor,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.w),
              child: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      laptop.name ?? "No name",
                      maxLines: 1,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  if (laptop.sales != 0)
                    Container(
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
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Text(
              laptop.company ?? "No company",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      "LE${laptop.price.toString().replaceFirst(".", "")}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 13,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColorDark,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        // width: 70,

                        height: 40.h,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColorDark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r))),
                        child: Center(
                          child: Text(
                            "BUY",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
