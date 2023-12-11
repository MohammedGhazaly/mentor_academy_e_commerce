import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/cart/add_to_cart_model.dart';
import 'package:meta/meta.dart';

part 'delete_item_cart_state.dart';

class DeleteItemCartCubit extends Cubit<DeleteItemCartState> {
  DeleteItemCartCubit() : super(DeleteItemCartInitial());
  static DeleteItemCartCubit get(context) => BlocProvider.of(context);
  bool isDeleteing = false;
  String? productId;

  Future<void> deleteItemFromCart(
      AddToCartModel addToCartModel, String clickedProudctId) async {
    productId = clickedProudctId;
    emit(DeleteCartLoading());
    isDeleteing = true;
    try {
      var response = await DioHelperStore.delData(
          url: ApiConstants.deleteCart, data: addToCartModel.toJson());
      print(response.data);
      emit(DeleteCartSuccess());
      isDeleteing = false;
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          emit(DeleteCartFailure(errorMessage: "No internet connection"));
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          emit(
              DeleteCartFailure(errorMessage: "It took to long to fetch data"));
        }
        if (e.type == DioExceptionType.badResponse) {
          emit(DeleteCartFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something went wrong"));
        }
      } else {
        emit(DeleteCartFailure(errorMessage: "Something went wrong"));
      }
      isDeleteing = false;
    }
  }
}
