import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';

class DefaultErrorWidget extends StatelessWidget {
  final String errorMessage;
  final void Function()? onPressedFunction;
  const DefaultErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.primaryColorDark,
            ),
            onPressed: onPressedFunction,
            icon: const Icon(
              Icons.restart_alt,
            ),
            label: const Text(
              "Try again",
            ),
          )
        ],
      ),
    );
  }
}
