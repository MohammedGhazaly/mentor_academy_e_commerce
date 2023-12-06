import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/core/managers/images.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_bottom_widget.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_item.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_top_widget.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.4,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.h,
                ),
                itemBuilder: (context, index) {
                  return ProductItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
