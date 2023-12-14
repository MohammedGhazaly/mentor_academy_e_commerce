import 'package:flutter/material.dart';

class ProfileDetailsWidget extends StatelessWidget {
  final String detailKey;
  final String detailValue;
  const ProfileDetailsWidget({
    super.key,
    required this.detailKey,
    required this.detailValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: Text(
        "$detailKey: ${detailValue}",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
