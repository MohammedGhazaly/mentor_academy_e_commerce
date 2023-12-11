import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubit/get/get_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubit/get/get_cart_states.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartStates>(
      builder: (context, state) {
        if (state is GetCartFailure) {}
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              CartItem(),
            ],
          ),
        );
      },
    );
  }
}
