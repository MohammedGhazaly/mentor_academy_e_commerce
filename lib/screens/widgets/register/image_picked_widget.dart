import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/images.dart';

class ImagePickedWidget extends StatelessWidget {
  final File? image;
  final void Function()? onIconClicked;
  const ImagePickedWidget({
    super.key,
    this.image,
    this.onIconClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: FileImage(image!),
        ),
        Positioned(
          bottom: -20.h,
          right: -10.w,
          child: IconButton(
            onPressed: () {
              onIconClicked!();
            },
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
