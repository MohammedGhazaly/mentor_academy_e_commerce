import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/add/add_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/delete_item_cart/delete_item_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/models/cart/add_to_cart_model.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';

class CartItemDetails extends StatelessWidget {
  final Product product;
  const CartItemDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var addCartCubit = BlocProvider.of<AddCartCubit>(context, listen: true);
    var getCartCubit = BlocProvider.of<GetCartCubit>(context, listen: false);
    var deleteItemCubit =
        BlocProvider.of<DeleteItemCartCubit>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name ?? "",
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.primaryColorDark,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            Text(
              "LE ${product.price.toString().replaceFirst(".", "")}",
            ),
            SizedBox(
              width: 8.w,
            ),
            Container(
              height: 15.h,
              width: 2,
              color: AppColors.primaryColorDark,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Text(
                product.company ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 14.sp),
              ),
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            (deleteItemCubit.isDeleteing &&
                    product.id! == deleteItemCubit.productId)
                ? LoadingAnimationWidget.inkDrop(
                    size: 18.sp,
                    color: AppColors.primaryColorDark,
                  )
                : InkWell(
                    onTap: () async {
                      String nationId =
                          CacheHelper.getData(key: AppKeys.userNationalId);
                      AddToCartModel addToCartModel = AddToCartModel(
                        nationalId: nationId,
                        productId: product.id ?? "",
                        quantity: "1",
                      );
                      await deleteItemCubit.deleteItemFromCart(
                          addToCartModel, product.id ?? "");
                      await getCartCubit.getProducts(nationalId: nationId);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_rounded,
                          color: AppColors.primaryColorDark,
                        ),
                        Text(
                          "Remove",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
            Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (product.quantity != 1) {}
                  },
                  child: Container(
                    width: 25.h,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: product.quantity == 1
                          ? Colors.grey
                          : AppColors.primaryColorDark,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  product.quantity.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColorDark,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                InkWell(
                  onTap: () async {
                    String nationId =
                        CacheHelper.getData(key: AppKeys.userNationalId);
                    AddToCartModel addToCartModel = AddToCartModel(
                      nationalId: nationId,
                      productId: product.id ?? "",
                      quantity: "1",
                    );
                    await addCartCubit.addToCart(
                        addToCartModel, product.id ?? "");
                    if (!context.mounted) return;
                    await getCartCubit.getProducts(nationalId: nationId);
                  },
                  child: Container(
                    width: 25.h,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorDark,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: (addCartCubit.isAdding &&
                            product.id! == addCartCubit.productId)
                        ? Center(
                            child: LoadingAnimationWidget.inkDrop(
                              size: 12.sp,
                              color: Colors.white,
                            ),
                          )
                        : Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
