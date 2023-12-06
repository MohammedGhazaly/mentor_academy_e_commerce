import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_bottom_widget.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_top_widget.dart';

class ProductItem extends StatelessWidget {
  final LaptopModel laptopModel;
  const ProductItem({super.key, required this.laptopModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        children: [
          Expanded(
            child: ProductTopWidget(laptop: laptopModel),
          ),
          Expanded(
            child: ProductBottomWidget(laptop: laptopModel),
          )
        ],
      ),
    );
  }
}
