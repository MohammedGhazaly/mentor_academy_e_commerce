import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validatorFunction;
  final String? label;
  final String? hint;
  final IconData? prefix;
  final bool showText;
  final Function()? onTap;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final IconData? suffix;
  final Function()? suffixPress;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  const DefaultFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.validatorFunction,
    this.hint,
    this.label,
    this.prefix,
    this.showText = true,
    this.onTap,
    this.onChange,
    this.onSubmit,
    this.suffix,
    this.suffixPress,
    this.labelStyle,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: validatorFunction,
      controller: controller,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.normal),
        labelText: label,
        labelStyle: labelStyle,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[500]!),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        // borderRadius: BorderRadius.circular(30
        prefixIcon: prefix != null ? Icon(prefix, color: Colors.black) : null,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix), onPressed: suffixPress, color: Colors.black)
            : null,
      ),
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: !showText,
      onTap: onTap,
    );
  }
}
