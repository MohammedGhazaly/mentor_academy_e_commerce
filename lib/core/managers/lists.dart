import 'package:mentor_academy_e_commerce/core/managers/images.dart';
import 'package:mentor_academy_e_commerce/models/onboarding/onboarding_model.dart';

class AppLists {
  static List<OnBoradingModel> onBoarding = [
    OnBoradingModel(
        title: "Welcome",
        subtitle: "We have many products.",
        image: AppImages.onBoardingImage),
    OnBoradingModel(
        title: "Shopping made easy",
        subtitle: "We guarantee you will have good time shopping.",
        image: AppImages.onBoardingImage),
    OnBoradingModel(
      title: "Start now",
      subtitle: "Start browsing through thousands of items.",
      image: AppImages.onBoardingImage,
    ),
  ];
}
