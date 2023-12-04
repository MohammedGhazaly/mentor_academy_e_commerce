import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({
    super.key,
    required this.onChangedFunction,
  });

  final void Function(String?)? onChangedFunction;
  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  var dropDownValue = "male";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: EdgeInsets.all(8.h),
      elevation: 10,
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      isExpanded: true,
      value: dropDownValue,
      icon: Icon(
        dropDownValue == "male" ? Icons.male_rounded : Icons.female_rounded,
        color: Colors.black,
        size: 24.sp,
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
      ),
      items: [
        DropdownMenuItem<String>(
          value: "male",
          child: Text(
            "Male",
            style: TextStyle(color: Colors.black),
          ),
        ),
        DropdownMenuItem<String>(
          value: "female",
          child: Text(
            "Female",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
      onChanged: (value) {
        widget.onChangedFunction!(value);
        dropDownValue = value ?? dropDownValue;
        setState(() {});
      },
    );
  }
}
