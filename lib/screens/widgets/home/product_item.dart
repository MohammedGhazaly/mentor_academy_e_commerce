import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_bottom_widget.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_top_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        children: [
          Expanded(flex: 1, child: ProductTopWidget()),
          Expanded(child: ProductBottomWidget())
        ],
      ),
    );
  }
}
