import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_states.dart';
import 'package:mentor_academy_e_commerce/core/controllers/favorite_cubit/favorite_cubit.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item_details.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/cart/cart_item_image.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/favorite/favorite_item.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/favorite/favorite_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getCartCubit = BlocProvider.of<FavoriteCubit>(context, listen: false);
    return BlocBuilder<GetCartCubit, GetCartStates>(
      builder: (context, state) {
        return FavoriteListView(products: getCartCubit.products);
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
