import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/add/add_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/delete_item_cart/delete_item_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/favorite_cubit/favorite_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/login_cubit/login_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/onboarding_cubit/onboarding_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/product_cubit/product_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/register_cubit/register_cubit.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/managers/router.dart';
import 'package:mentor_academy_e_commerce/core/managers/themes.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/core/network/remote/dio_helper.dart';
import 'package:mentor_academy_e_commerce/screens/modules/login.dart';
import 'package:mentor_academy_e_commerce/screens/modules/onboarding.dart';
import 'package:mentor_academy_e_commerce/screens/modules/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelperStore.init();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  bool? isBoardingFinished = CacheHelper.getData(key: AppKeys.boardingKey);
  String? token = CacheHelper.getData(key: AppKeys.tokenKey);
  String? nationalId = CacheHelper.getData(key: AppKeys.userNationalId);
  runApp(MyApp(
    isBoardingFinished: isBoardingFinished,
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isBoardingFinished;
  final String? token;
  const MyApp({super.key, required this.isBoardingFinished, this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AddCartCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => GetCartCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => DeleteItemCartCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
          lazy: false,
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
            routes: AppRouter.router,
            initialRoute: isBoardingFinished == null
                ? OnBoardingScreen.routeName
                : token == null
                    ? LoginScreen.routeName
                    : RootScreen.routeName,
            // initialRoute: HomeScreen.routeName,
          );
        },
      ),
    );
  }
}
