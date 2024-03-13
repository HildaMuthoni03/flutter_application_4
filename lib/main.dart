import 'package:flutter/material.dart';
import 'package:flutter_application_4/utils/Routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/Login",
    getPages: Routes.routes,
    debugShowCheckedModeBanner: false,
  ));

}
