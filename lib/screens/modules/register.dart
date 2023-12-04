import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_academy_e_commerce/core/controllers/register_cubit/register_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/images.dart';
import 'package:mentor_academy_e_commerce/core/widgets/text_form.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/register/gender_drop_down.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/register/image_picked_widget.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/register/modal_bottom_sheet_widget.dart';
import 'package:mentor_academy_e_commerce/screens/widgets/register/no_image_picked_widget.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "register-screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController nationalIdController;
  late final TextEditingController passwordController;
  late RegisterCubit cubit;
  String gender = "male";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    nationalIdController = TextEditingController();
    passwordController = TextEditingController();
    cubit = RegisterCubit.get(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nationalIdController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        cubit.image == null
                            ? NoImagePickedWidget(
                                onIconClicked: () {
                                  showModalForImage(context);
                                },
                              )
                            : ImagePickedWidget(
                                image: cubit.image,
                                onIconClicked: () {
                                  showModalForImage(context);
                                },
                              )
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    DefaultFormField(
                      prefix: Icons.person_rounded,
                      hint: "Name",
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name should not be empty.";
                        } else if (value.length < 3) {
                          return "Name should be at least 3 chars.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    DefaultFormField(
                      prefix: Icons.phone_rounded,
                      hint: "Phone",
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone should not be empty.";
                        } else if (value[0] != "0" || value[1] != "0") {
                          return "Phone must start with 01";
                        } else if (value.length != 11) {
                          return "Phone must be 11 digits.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    DefaultFormField(
                      prefix: Icons.credit_card_outlined,
                      hint: "National Id",
                      controller: nationalIdController,
                      keyboardType: TextInputType.number,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return "National id should not be empty.";
                        } else if (value.length != 14) {
                          return "National id should be at least 14";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
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
                    GenderDropDown(
                      onChangedFunction: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showModalForImage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ModalBottomSheetWidget(
          cameraClicked: () {
            cubit.addImage(source: ImageSource.camera);
          },
          galleryClicked: () {
            cubit.addImage(source: ImageSource.gallery);
          },
        );
      },
    );
  }
}