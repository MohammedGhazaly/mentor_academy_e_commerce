import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/product_details/product_header_big.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSlider extends StatefulWidget {
  final LaptopModel laptop;
  const ProductImageSlider({super.key, required this.laptop});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.laptop.images?.length ?? 0,
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return ProductHeaderBig(
              laptop: widget.laptop,
              index: itemIndex,
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reson) {
              setState(() {
                activeIndex = index;
              });
            },
            enlargeCenterPage: true,
            pageSnapping: true,
            padEnds: false,
            viewportFraction: 1,
            // enlargeFactor: 0.5,
            clipBehavior: Clip.none,
            height: 310.h,
            enableInfiniteScroll: true,
            autoPlay: false,
            // autoPlayInterval: const Duration(seconds: 4),
            scrollDirection: Axis.horizontal,
          ),
        ),
        Positioned.fill(
          bottom: 10.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              effect: ExpandingDotsEffect(
                  radius: 8.r,
                  dotWidth: 12.w,
                  dotHeight: 12.w,
                  dotColor: Colors.grey,
                  activeDotColor: AppColors.primaryColorDark),
              activeIndex: activeIndex,
              count: widget.laptop.images!.length,
            ),
          ),
        ),
      ],
    );
  }
}
