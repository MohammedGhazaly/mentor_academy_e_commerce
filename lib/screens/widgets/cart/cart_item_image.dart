import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';

class CartItemImage extends StatelessWidget {
  final Product product;
  const CartItemImage({
    super.key,
    required this.product,
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
                CachedNetworkImage(
                  imageUrl: product.image ?? "",
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
                    child: product.sales != 0
                        ? Center(
                            child: Text(
                              "${product.sales}% off",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
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
