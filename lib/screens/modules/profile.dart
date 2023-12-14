import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mentor_academy_e_commerce/core/controllers/profile_cubit/profile_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/profile_cubit/profile_states.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/profile/profile_details_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: CachedNetworkImageProvider(
                      state.user.profileImage ?? "",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              ProfileDetailsWidget(
                  detailKey: "Name", detailValue: state.user.name ?? ""),
              SizedBox(
                height: 12,
              ),
              ProfileDetailsWidget(
                  detailKey: "Email", detailValue: state.user.email ?? ""),
              SizedBox(
                height: 12,
              ),
              ProfileDetailsWidget(
                  detailKey: "Phone", detailValue: state.user.phone ?? ""),
              SizedBox(
                height: 24,
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 48),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                icon: Icon(Icons.edit_outlined),
                label: Text("Edit Profile"),
              )
            ],
          );
        } else {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              size: 32.sp,
              color: AppColors.primaryColor,
            ),
          );
        }
      },
    );
  }
}
