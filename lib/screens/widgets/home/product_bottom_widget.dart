import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubit/add/add_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubit/add/add_cart_states.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/models/cart/add_to_cart_model.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';

class ProductBottomWidget extends StatelessWidget {
  final LaptopModel laptop;
  const ProductBottomWidget({
    super.key,
    required this.laptop,
  });

  @override
  Widget build(BuildContext context) {
    var carCubit = BlocProvider.of<AddCartCubit>(context, listen: true);
    return Container(
      color: AppColors.lightColor,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.w),
              child: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      laptop.name ?? "No name",
                      maxLines: 1,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.sp, decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  if (laptop.sales != 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${laptop.sales}% off",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Text(
              laptop.company ?? "No company",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: AutoSizeText(
                          "LE ${laptop.price.toString().replaceFirst(".", "")}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 13,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColorDark,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () async {
                        AddToCartModel addToCartModel = AddToCartModel(
                          nationalId:
                              CacheHelper.getData(key: AppKeys.userNationalId),
                          productId: laptop.sId!,
                          quantity: "1",
                        );
                        if (!(carCubit.isAdding &&
                            laptop.sId! == carCubit.productId)) {
                          await AddCartCubit.get(context)
                              .addToCart(addToCartModel, laptop.sId!);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        width: 70,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColorDark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r))),
                        child: Center(
                          child: (carCubit.isAdding &&
                                  laptop.sId! == carCubit.productId)
                              ? SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "ADD",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                          //     child:
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
