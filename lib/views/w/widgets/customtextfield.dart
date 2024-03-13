import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData? icon;
  final bool hideText;
  final bool isPassword;
  final String? hint;

  const CustomTextField({
    super.key,
    required this.controller,
    this.icon,
    this.hideText = false,
    this.isPassword = false,
    this.hint,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: hint,
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? Icon(Icons.visibility_rounded)
              : Container(
                  height: 10,
                  width: 10,
                )),
    );
  }
}