import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';

class FavoriteItemDetails extends StatelessWidget {
  final Product product;
  const FavoriteItemDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                product.name ?? "",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.favorite_border)
          ],
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
        Text(
          product.description ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
