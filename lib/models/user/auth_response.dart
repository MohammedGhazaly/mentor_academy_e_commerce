import 'package:mentor_academy_e_commerce/models/user/user_model.dart';

class AuthResponse {
  String? status;
  String? message;
  User? user;

  AuthResponse({this.status, this.message, this.user});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
