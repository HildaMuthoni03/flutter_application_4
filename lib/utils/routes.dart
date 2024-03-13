import 'package:flutter_application_4/views/pages/calculator.dart';
import 'package:flutter_application_4/views/pages/home.dart';
import 'package:flutter_application_4/views/pages/login.dart';
import 'package:flutter_application_4/views/pages/dashboard.dart';
import 'package:get/get.dart';

class Routes {
  static var routes = [
    GetPage(name: "/Login", page: () => Login()),
    GetPage(name: "/dashboard", page: () => Dashboard()),
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/calculator", page: () => Calculator()),

  ];
}