import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/constants.dart';
import 'package:flutter_application_4/views/w/widgets/customText.dart';

class CustomButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback? action;
  const CustomButton({
    super.key,
    required this.buttonLabel,
    this.action, required String buttonText, required String CustomText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 4,
        padding: EdgeInsets.all(15),
        shadowColor: primaryColor,
      ),
      child: CustomText(
        label: buttonLabel,
        labelColor: appWhite,
      ),
    );
  }
}
