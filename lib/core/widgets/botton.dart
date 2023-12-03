import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Widget buttonWidget;
  final Function() onPressedFunction;
  final double width;
  final Color? backgroundColor;
  final bool isUpperCase;
  final double radius;
  final double height;
  final Color borderColor;
  const DefaultButton({
    super.key,
    this.height = 50,
    required this.buttonWidget,
    required this.onPressedFunction,
    this.backgroundColor = Colors.black,
    this.width = double.infinity,
    this.isUpperCase = true,
    this.radius = 10.0,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: onPressedFunction,
        child: buttonWidget,
      ),
    );
  }
}
