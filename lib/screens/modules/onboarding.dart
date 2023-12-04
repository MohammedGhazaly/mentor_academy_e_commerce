import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/controllers/onboarding_cubit/onboarding_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/lists.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/onboarding/onboarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController pageViewControleer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewControleer = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Pixel"),
          ),
          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: PageView.builder(
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
            ],
          ),
        );
      },
    );
  }
}
