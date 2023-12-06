import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/product_details/build_product_details.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/product_details/product_image_slider.dart';

class ProductDetail extends StatelessWidget {
  static String routeName = "product-detail";
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final LaptopModel laptop =
        ModalRoute.of(context)!.settings.arguments as LaptopModel;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(laptop: laptop),
            SizedBox(
              height: 24.h,
            ),
            buildProductDetails(laptop),
          ],
        ),
      ),
    );
  }
}
