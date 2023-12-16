import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mentor_academy_e_commerce/core/controllers/profile_cubit/profile_cubit.dart';
import 'package:mentor_academy_e_commerce/core/managers/colors.dart';
import 'package:mentor_academy_e_commerce/models/auth/user_model.dart';

class EditModalBottomWidget extends StatefulWidget {
  final User user;

  const EditModalBottomWidget({super.key, required this.user});

  @override
  State<EditModalBottomWidget> createState() => _EditModalBottomWidgetState();
}

class _EditModalBottomWidgetState extends State<EditModalBottomWidget> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context, listen: true);
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EditModalBottomWidgetTextField(
            textEditingController: nameController,
            labelText: "Name",
          ),
          SizedBox(
            height: 24,
          ),
          EditModalBottomWidgetTextField(
            textEditingController: emailController,
            labelText: "Email address",
          ),
          SizedBox(
            height: 24,
          ),
          EditModalBottomWidgetTextField(
            textEditingController: phoneController,
            labelText: "Phone",
          ),
          SizedBox(
            height: 36,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              onPressed: () async {
                await profileCubit.updateUserData(
                    newName: nameController.text,
                    newEmail: emailController.text,
                    newPhone: phoneController.text);
                await profileCubit.getUserData();
                if (!context.mounted) return;
                Navigator.pop(context);
              },
              child: Center(
                child: profileCubit.isUpdating
                    ? LoadingAnimationWidget.inkDrop(
                        size: 24.sp,
                        color: Colors.white,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Edit"),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.done,
                          )
                        ],
                      ),
              ))
        ],
      ),
    );
  }
}

class EditModalBottomWidgetTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  const EditModalBottomWidgetTextField({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        label: Text(labelText),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
