import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/managers/images.dart';

class NoImagePickedWidget extends StatelessWidget {
  const NoImagePickedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(
            AppImages.personImage,
          ),
        ),
        Positioned(
          bottom: -20.h,
          right: -10.w,
          child: IconButton(
            onPressed: () {},
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
