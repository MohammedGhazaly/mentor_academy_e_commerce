import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/auth/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  late User user;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      var response = await DioHelperStore.postData(
        url: ApiConstants.loginEndPoint,
        data: {"email": email, "password": password},
      );
      print(response.data["status"]);

      if (response.data["status"] == "error") {
        emit(
          LoginError(errorMessage: response.data["message"]),
        );
      } else {
        User user = User.fromJson(response.data["user"]);
        await CacheHelper.saveData(key: AppKeys.tokenKey, value: user.token);
        await CacheHelper.saveData(
            key: AppKeys.userNationalId, value: user.nationalId);

        emit(LoginSuccess());
      }
    } catch (e) {
      if (e is SocketException) {
        emit(
          LoginError(errorMessage: "No internet"),
        );
      }
      if (e is DioException) {
        if (e.response!.statusCode == 400) {
          emit(
            LoginError(
                errorMessage:
                    e.response?.data["message"] ?? "Something went wrong."),
          );
        }
      } else if (e is SocketException) {
        emit(
          LoginError(errorMessage: "No internet connection"),
        );
      }
    }
  }
}
