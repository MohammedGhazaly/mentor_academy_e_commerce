import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/managers/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/managers/nav.dart';
import 'package:mentor_academy_e_commerce/core/managers/values.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/screens/modules/login.dart';
import 'package:mentor_academy_e_commerce/screens/modules/onboarding.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingNotLast());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  bool isLastPage = false;
  int screenIndex = 0;

  void emitPageLast(index) {
    isLastPage = true;
    screenIndex = index;
    emit(OnboardingLast());
  }

  void emitPageNotLast(index) {
    isLastPage = false;
    screenIndex = index;
    emit(OnboardingNotLast());
  }

  void onGetStarted(context) {
    CacheHelper.saveData(key: AppKeys.boardingKey, value: true).then((value) {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });
  }
}
