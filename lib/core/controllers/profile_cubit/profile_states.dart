import 'package:mentor_academy_e_commerce/models/auth/user_model.dart';

abstract class ProfileStates {}

class ProfileSuccess extends ProfileStates {
  final User user;

  ProfileSuccess({required this.user});
}

class ProfileInitial extends ProfileStates {}

class ProfileFailure extends ProfileStates {
  final String errorMessage;

  ProfileFailure({required this.errorMessage});
}

class ProfileLoading extends ProfileStates {}
