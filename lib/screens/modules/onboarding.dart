import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/controllers/onboarding_cubit/onboarding_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/lists.dart';
import 'package:mentor_academy_e_commerce/core/widgets/botton.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/onboarding/onboarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "on-boarding-route";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController pageViewControleer;
  late OnboardingCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewControleer = PageController();
    cubit = OnboardingCubit.get(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewControleer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Pixel"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      if (index == AppLists.onBoarding.length - 1) {
                        cubit.emitPageLast(index);
                      } else {
                        cubit.emitPageNotLast(index);
                      }
                    },
                    itemCount: AppLists.onBoarding.length,
                    controller: pageViewControleer,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OnbardingItem(
                        onBoradingModel: AppLists.onBoarding[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (state is OnboardingLast)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 64.w),
                    child: DefaultButton(
                      backgroundColor: Colors.black,
                      buttonWidget: const Text(
                        "Get started",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressedFunction: () {
                        cubit.onGetStarted(context);
                      },
                    ),
                  ),
                if (state is OnboardingNotLast)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 64.w),
                    child: DefaultButton(
                      backgroundColor: Colors.black,
                      buttonWidget: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressedFunction: () {
                        pageViewControleer.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
