import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_states.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/core/widgets/default_error_widget.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_listview.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getCartCubit = BlocProvider.of<GetCartCubit>(context, listen: false);
    return BlocBuilder<GetCartCubit, GetCartStates>(
      builder: (context, state) {
        if (state is GetCartFailure) {
          return DefaultErrorWidget(
            errorMessage: state.errorMessage ?? "",
            onPressedFunction: () async {
              final String nationalId =
                  CacheHelper.getData(key: AppKeys.userNationalId) as String;
              await GetCartCubit.get(context)
                  .getProducts(nationalId: nationalId);
            },
          );
        } else if (state is GetCartSuccess) {
          return CartListView(
            products: getCartCubit.products,
          );
        } else if (state is GetCartLoading) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              size: 32.sp,
              color: AppColors.primaryColor,
            ),
          );
        } else {
          return CartListView(
            products: getCartCubit.products,
          );
        }
      },
    );
  }
}
