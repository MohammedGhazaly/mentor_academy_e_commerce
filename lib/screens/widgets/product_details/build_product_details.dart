import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';

Padding buildProductDetails(LaptopModel laptop) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Hero(
                tag: "${laptop.sId}name",
                child: Text(
                  laptop.name ?? "",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            Hero(
              tag: "${laptop.sId}price",
              child: Text(
                "LE ${laptop.price.toString().replaceFirst(".", "")}",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          "Description",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          laptop.description ?? "",
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(color: Colors.white, width: 2)),
          child: Text(
            "items In stock: ${laptop.countInStock.toString()}",
            style: TextStyle(fontSize: 13.sp, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text("Buy now"),
                  SizedBox(
                    width: 4.w,
                  ),
                  Icon(
                    Icons.payments_rounded,
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primaryColorDark,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_shopping_cart_rounded,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text("Add to cart"),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
