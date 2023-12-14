import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  List<Product> products = [];
  List<String> favoriteIds = [];

  Future<void> getProducts({required String nationalId}) async {
    emit(FavoriteLoading());
    try {
      var response = await DioHelperStore.getData(
          url: ApiConstants.getFavorites, data: {"nationalId": nationalId});

      products = [];
      favoriteIds = [];

      if (response.statusCode == 200) {
        for (var product in response.data["favoriteProducts"]) {
          products.add(Product.fromJson(product));

          favoriteIds.add(Product.fromJson(product).id ?? "");
        }
        emit(FavoriteSuccess(products: products));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          emit(FavoriteFailure(errorMessage: "No internet connection"));
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          emit(FavoriteFailure(errorMessage: "It took to long to fetch data"));
        }
        if (e.type == DioExceptionType.badResponse) {
          emit(FavoriteFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something went wrong"));
        }
      } else {
        emit(FavoriteFailure(errorMessage: "Something went wrong"));
      }
    }
  }

  Future<void> addFavorite(
      {required String nationalId, required String productId}) async {
    try {
      var response = await DioHelperStore.postData(
          url: ApiConstants.getFavorites,
          data: {"nationalId": nationalId, "productId": productId});

      await getProducts(nationalId: nationalId);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          emit(AddFavoriteFailure(errorMessage: "No internet connection"));
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          emit(AddFavoriteFailure(
              errorMessage: "It took to long to fetch data"));
        }
        if (e.type == DioExceptionType.badResponse) {
          emit(AddFavoriteFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something went wrong"));
        }
      } else {
        emit(AddFavoriteFailure(errorMessage: "Something went wrong"));
      }
    }
  }

  Future<void> removeFavorite(
      {required String nationalId, required String productId}) async {
    try {
      var response = await DioHelperStore.delData(
          url: ApiConstants.getFavorites,
          data: {"nationalId": nationalId, "productId": productId});
      await getProducts(nationalId: nationalId);
      emit(state);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          emit(AddFavoriteFailure(errorMessage: "No internet connection"));
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          emit(AddFavoriteFailure(
              errorMessage: "It took to long to fetch data"));
        }
        if (e.type == DioExceptionType.badResponse) {
          emit(AddFavoriteFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something went wrong"));
        }
      } else {
        emit(AddFavoriteFailure(errorMessage: "Something went wrong"));
      }
    }
  }
}
