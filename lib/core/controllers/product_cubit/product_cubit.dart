import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  Future<void> getLaptops() async {
    try {
      var response =
          await DioHelperStore.getData(url: ApiConstants.getProductsEndPoint);
      if (response.statusCode != 200) {
        emit(ProductFailure(errorMessage: response.data["message"]));
      } else {
        List<LaptopModel> laptops = [];
        for (var laptop in response.data["product"]) {
          laptops.add(LaptopModel.fromJson(laptop));
        }
        emit(ProductSuccess(laptops: laptops));
      }
    } catch (e) {
      if (e is SocketException) {
        emit(ProductFailure(errorMessage: "No internet connection"));
      } else if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          emit(ProductFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something wentwrong"));
        }
      } else {
        emit(ProductFailure(errorMessage: "Something went wrong"));
      }
    }
  }
}