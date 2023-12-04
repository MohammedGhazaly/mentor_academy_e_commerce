import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/controllers/onboarding_cubit/onboarding_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/themes.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/screens/modules/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelperStore.init();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
          lazy: true,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
