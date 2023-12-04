import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  final void Function()? cameraClicked;
  final void Function()? galleryClicked;
  const ModalBottomSheetWidget({
    super.key,
    this.cameraClicked,
    this.galleryClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.35,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: cameraClicked,
            icon: Icon(
              Icons.photo_camera,
              size: 32.sp,
            ),
          ),
          IconButton(
            onPressed: galleryClicked,
            icon: Icon(
              Icons.image_rounded,
              size: 32.sp,
            ),
          ),
        ],
      ),
    );
  }
}
