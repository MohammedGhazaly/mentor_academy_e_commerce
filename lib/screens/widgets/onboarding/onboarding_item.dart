import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/models/onboarding_model.dart';

class OnbardingItem extends StatelessWidget {
  final OnBoradingModel onBoradingModel;
  const OnbardingItem({super.key, required this.onBoradingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            onBoradingModel.image,
            width: 250.w,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          onBoradingModel.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          onBoradingModel.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
