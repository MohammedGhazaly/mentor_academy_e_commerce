import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mentor_academy_e_commerce/core/controllers/login_cubit/login_cubit.dart';
import 'package:mentor_academy_e_commerce/core/widgets/botton.dart';
import 'package:mentor_academy_e_commerce/core/widgets/text_form.dart';
import 'package:mentor_academy_e_commerce/screens/modules/home.dart';
import 'package:mentor_academy_e_commerce/screens/modules/register.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login-screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;
  late LoginCubit cubit;

  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cubit = LoginCubit.get(context);
    formKey = GlobalKey<FormState>();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                state.errorMessage,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          );
        }
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        DefaultFormField(
                          prefix: Icons.mail_rounded,
                          hint: "Email address",
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validatorFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email should not be empty.";
                            } else if (!EmailValidator.validate(value)) {
                              return "Please enter a valid number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        DefaultFormField(
                          prefix: Icons.password_rounded,
                          showText: false,
                          hint: "Password",
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validatorFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password should not be empty.";
                            } else if (value.length < 8) {
                              return "Password should be at least 8 chars";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        DefaultButton(
                          buttonWidget: (state is LoginLoading)
                              ? LoadingAnimationWidget.inkDrop(
                                  color: Colors.white, size: 24.sp)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                          onPressedFunction: () async {
                            if (state is! LoginLoading) {
                              if (formKey.currentState!.validate()) {
                                await cubit.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                if (!context.mounted) return;
                                print("Done");
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(
                                    0.75,
                                  ),
                                ),
                              ),
                              Text(
                                " Register",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
