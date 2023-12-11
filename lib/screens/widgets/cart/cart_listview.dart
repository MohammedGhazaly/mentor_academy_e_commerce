import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item.dart';

class CartListView extends StatelessWidget {
  final List<Product> products;
  const CartListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              duration: Duration(milliseconds: 500),
              position: index,
              child: SlideAnimation(
                horizontalOffset: -300.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: CartItem(product: products[index]),
                ),
              ),
            );
          }),
    );
  }
}
