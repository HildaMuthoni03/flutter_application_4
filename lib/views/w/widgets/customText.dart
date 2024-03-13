import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/constants.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double uFontSize;
  const CustomText({
    super.key,
    required this.label,
    this.labelColor = appGrey,
    this.uFontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
            color: labelColor,
            fontSize: uFontSize,
            fontWeight: FontWeight.w700));
  }
}