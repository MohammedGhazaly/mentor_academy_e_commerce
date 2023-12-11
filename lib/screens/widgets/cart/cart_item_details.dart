import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';

class CartItemDetails extends StatelessWidget {
  final Product product;
  const CartItemDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name ?? "",
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.primaryColorDark,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Text(
              "LE ${product.price.toString().replaceFirst(".", "")}",
            ),
            SizedBox(
              width: 8.w,
            ),
            Container(
              height: 15.h,
              width: 2,
              color: AppColors.primaryColorDark,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Text(
                product.company ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 14.sp),
              ),
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.delete_rounded,
                    color: AppColors.primaryColorDark,
                  ),
                  Text(
                    "Remove",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (product.quantity != 1) {}
                  },
                  child: Container(
                    width: 25.h,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: product.quantity == 1
                          ? Colors.grey
                          : AppColors.primaryColorDark,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  product.quantity.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColorDark,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 25.h,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorDark,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
