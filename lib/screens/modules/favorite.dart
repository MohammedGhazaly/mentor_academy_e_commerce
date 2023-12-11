import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mentor_academy_e_commerce/core/controllers/favorite_cubit/favorite_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/core/widgets/default_error_widget.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/favorite/favorite_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getCartCubit = BlocProvider.of<FavoriteCubit>(context, listen: false);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteFailure) {
          return DefaultErrorWidget(
            errorMessage: state.errorMessage,
            onPressedFunction: () async {
              final String nationalId =
                  CacheHelper.getData(key: AppKeys.userNationalId) as String;
              await FavoriteCubit.get(context)
                  .getProducts(nationalId: nationalId);
            },
          );
        } else if (state is FavoriteSuccess) {
          return FavoriteListView(products: getCartCubit.products);
        } else {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              size: 32.sp,
              color: AppColors.primaryColor,
            ),
          );
        }
        // return Text(getCartCubit.products.length.toString());
      },
    );

    // return Container(
    //   width: double.infinity,
    //   padding: EdgeInsets.all(16.r),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(
    //       16.r,
    //     ),
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       CartItemImage(product: product),
    //       SizedBox(
    //         width: 16.w,
    //       ),
    //       Expanded(
    //         child: CartItemDetails(product: product),
    //       )
    //     ],
    //   ),
    // );
  }
}
