import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/controllers/favorite_cubit/favorite_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';

class ProductTopWidget extends StatelessWidget {
  final LaptopModel laptop;

  const ProductTopWidget({
    super.key,
    required this.laptop,
  });

  @override
  Widget build(BuildContext context) {
    final favCubit = BlocProvider.of<FavoriteCubit>(context, listen: true);
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Hero(
            tag: "${laptop.sId}status",
            child: RotatedBox(
              quarterTurns: 1,
              child: Container(
                color: AppColors.primaryColorDark,
                // width: 150.h,
                // height: 30.w,
                child: Center(
                  child: Text(
                    laptop.status ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Container(
                color: AppColors.primaryColor,
                width: 170.h,
                height: 170.h,
              ),
              Hero(
                tag: laptop.sId ?? "",
                child: CachedNetworkImage(
                  imageUrl: laptop.image ?? "",
                  width: 170.h,
                  height: 170.h,
                ),
              ),

              Positioned(
                top: 10.h,
                right: 10.h,
                child: InkWell(
                  onTap: () async {
                    String nationId =
                        CacheHelper.getData(key: AppKeys.userNationalId);
                    if (favCubit.favoriteIds.contains(laptop.sId)) {
                      await favCubit.removeFavorite(
                          nationalId: nationId, productId: laptop.sId ?? "");
                    } else {
                      await favCubit.addFavorite(
                          nationalId: nationId, productId: laptop.sId ?? "");
                    }
                  },
                  child: Hero(
                    tag: "${laptop.sId}icon",
                    child: Container(
                      width: 28.h,
                      height: 28.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColorLight,
                      ),
                      child: favCubit.favoriteIds.contains(laptop.sId)
                          ? Center(
                              child: Icon(
                                Icons.favorite,
                                size: 20.sp,
                                color: AppColors.primaryColorDark,
                              ),
                            )
                          : Icon(
                              Icons.favorite_outline_outlined,
                              size: 20.sp,
                              color: AppColors.primaryColorDark,
                            ),
                    ),
                  ),
                ),
              )
              // Text("Test")
            ],
          ),
        ),
      ],
    );
  }
}
