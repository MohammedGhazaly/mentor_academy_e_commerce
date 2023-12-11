import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mentor_academy_e_commerce/core/controllers/product_cubit/product_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/screens/modules/product_detail.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/home/product_item.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            return Column(
              children: [
                // SizedBox(
                //   height: 32.h,
                // ),
                Expanded(
                  child: AnimationLimiter(
                    child: GridView.builder(
                      itemCount: state.laptops.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.4,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.h,
                      ),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 500),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetail.routeName,
                                      arguments: state.laptops[index]);
                                },
                                child: ProductItem(
                                  laptopModel: state.laptops[index],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
              ],
            );
          }
          if (state is ProductFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
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
                    onPressed: () {
                      ProductCubit.get(context).getLaptops();
                    },
                    icon: Icon(
                      Icons.restart_alt,
                    ),
                    label: Text(
                      "Try again",
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              size: 32.sp,
              color: AppColors.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
