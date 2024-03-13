// ignore: file_names
import 'package:flutter/material.dart';

class TextEdit extends StatelessWidget {
  final IconData? icon;
  final bool ispassword;
  final bool hideText;
  const TextEdit({
    super.key,
    required this.usernameController,
    this.icon,
    this.hideText=false,
    this.ispassword=false
  });

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        border:OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: Icon(icon),
          suffixIcon: ispassword?Icon(Icons.visibility):Container(height: 10,width: 10,),
          ),
          obscureText: hideText,
          

      );
  }
}
