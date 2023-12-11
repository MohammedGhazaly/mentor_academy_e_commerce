import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_states.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';

class GetCartCubit extends Cubit<GetCartStates> {
  GetCartCubit() : super(GetCartInitial());
  static GetCartCubit get(context) => BlocProvider.of(context);
  List<Product> products = [];

  Future<void> getProducts({required String nationalId}) async {
    emit(GetCartLoading());
    try {
      var response = await DioHelperStore.getData(
          url: ApiConstants.getCart, data: {"nationalId": nationalId});
      products = [];

      if (response.statusCode == 200) {
        for (var product in response.data["products"]) {
          products.add(Product.fromJson(product));
        }

        emit(GetCartSuccess(products: products));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          emit(GetCartFailure(errorMessage: "No internet connection"));
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          emit(GetCartFailure(errorMessage: "It took to long to fetch data"));
        }
        if (e.type == DioExceptionType.badResponse) {
          emit(GetCartFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something went wrong"));
        }
      } else {
        emit(GetCartFailure(errorMessage: "Something went wrong"));
      }
    }
  }
}
