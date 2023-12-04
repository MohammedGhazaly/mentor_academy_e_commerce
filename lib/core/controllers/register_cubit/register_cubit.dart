import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_academy_e_commerce/core/network/api_constants.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/models/auth/user_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  late User user;
  ImagePicker imagePicker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? userImage;

  Future<void> addImage({required ImageSource source}) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      userImage = base64UrlEncode(bytes!);
      emit(ImagePicked());
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async {
    emit(RegisterLoading());

    try {
      var response = await DioHelperStore.postData(
        url: ApiConstants.registerEndPoint,
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "nationalId": nationalId,
          "gender": gender,
          "password": password,
          "profileImage": userImage,
        },
      );

      print(response.statusCode);
      print(response.data["status"]);
      if (response.data["status"] == "error") {
        emit(
          RegisterError(errorMessage: response.data["message"]),
        );
      } else {
        User user = User.fromJson(response.data);

        await CacheHelper.saveData(key: AppKeys.tokenKey, value: user.token);
        await CacheHelper.saveData(
            key: AppKeys.userNationalId, value: user.nationalId);

        emit(RegisterSuccess());
      }
    } on SocketException catch (e) {
      emit(
        RegisterError(errorMessage: "No internet"),
      );
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 400) {
          emit(
            RegisterError(
                errorMessage:
                    e.response?.data["message"] ?? "Something went wrong."),
          );
        }
      } else if (e is SocketException) {
        emit(
          RegisterError(errorMessage: "No internet connection"),
        );
      }
    }
  }
}
