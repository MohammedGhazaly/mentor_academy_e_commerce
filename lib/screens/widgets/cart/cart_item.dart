import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item_details.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

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
          CartItemImage(),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: CartItemDetails(),
          )
        ],
      ),
    );
  }
}
