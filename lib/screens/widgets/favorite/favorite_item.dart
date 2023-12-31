import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item_details.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/favorite/favorite_item_details.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/favorite/favorite_item_image.dart';

class FavoriteItem extends StatelessWidget {
  final Product product;
  const FavoriteItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteItemImage(product: product),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: FavoriteItemDetails(product: product),
          )
        ],
      ),
    );
  }
}
