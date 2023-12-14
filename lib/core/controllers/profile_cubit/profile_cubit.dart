import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/controllers/profile_cubit/profile_states.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/auth/user_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  User? user;

  Future<void> getUserData() async {
    // String token = CacheHelper.getData(key: AppKeys.tokenKey);
    String token = CacheHelper.getData(key: AppKeys.tokenKey);
    print(token);
    try {
      var response = await DioHelperStore.postData(
          url: ApiConstants.profileEndPoint,
          data: {"token": "gkkf811zmnwlq5lg4vz"});
      print("Response");

      if (response.data["status"] == "success" && response.statusCode == 200) {
        user = User.fromJson(response.data["user"]);
        emit(ProfileSuccess(user: user!));
        print("Success");
      } else {
        emit(ProfileFailure(errorMessage: response.data["message"]));
        print("Failure");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          emit(ProfileFailure(errorMessage: "No internet connection"));
        }
        if (e.type == DioExceptionType.connectionTimeout) {
          emit(ProfileFailure(errorMessage: "It took to long to fetch data"));
        }
        if (e.type == DioExceptionType.badResponse) {
          emit(ProfileFailure(
              errorMessage:
                  e.response?.data["message"] ?? "Something went wrong"));
        }
      } else {
        emit(ProfileFailure(errorMessage: "Something went wrong"));
      }
    }
  }
}
