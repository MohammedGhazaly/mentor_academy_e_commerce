import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item.dart';

class CartListView extends StatelessWidget {
  final List<Product> products;
  const CartListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: CartItem(product: products[index]),
          );
        });
  }
}
