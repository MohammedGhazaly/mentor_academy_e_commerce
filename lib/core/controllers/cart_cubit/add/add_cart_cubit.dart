import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubit/add/add_cart_states.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/cart/add_to_cart_model.dart';

class AddCartCubit extends Cubit<AddCartStates> {
  AddCartCubit() : super(AddCartInitil());
  static AddCartCubit get(context) => BlocProvider.of(context);
  bool isAdding = false;
  String? productId;

  Future<void> addToCart(
      AddToCartModel addToCartModel, String clickedProudctId) async {
    productId = clickedProudctId;
    emit(AddCartLoading());
    isAdding = true;
    try {
      var response = await DioHelperStore.postData(
          url: ApiConstants.addToCart, data: addToCartModel.toJson());
      emit(AddCartSuccess());
      isAdding = false;
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          emit(AddCartFailure(errorMessage: "No internet connection"));
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          emit(AddCartFailure(errorMessage: "It took to long to fetch data"));
        }
        if (e.type == DioExceptionType.badResponse) {
          emit(AddCartFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something went wrong"));
        }
      } else {
        emit(AddCartFailure(errorMessage: "Something went wrong"));
      }
      isAdding = false;
    }
  }

  // Future<void> getProducts({required String nationalId}) async {
  //   emit(GettingCartLoading());
  //   try {
  //     var response = await DioHelperStore.getData(
  //         url: ApiConstants.getCart, data: {"nationalId": nationalId});
  //     emit(GettingCartSuccess());
  //     isAdding = false;
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       if (e.type == DioExceptionType.connectionError) {
  //         emit(GettingCartFailure(errorMessage: "No internet connection"));
  //       }
  //       if (e.type == DioExceptionType.connectionTimeout) {
  //         emit(GettingCartFailure(
  //             errorMessage: "It took to long to fetch data"));
  //       }
  //       if (e.type == DioExceptionType.badResponse) {
  //         emit(GettingCartFailure(
  //             errorMessage:
  //                 e.response?.data["message"] ?? "Something went wrong"));
  //       }
  //     } else {
  //       emit(GettingCartFailure(errorMessage: "Something went wrong"));
  //     }
  //   }
  // }
}
