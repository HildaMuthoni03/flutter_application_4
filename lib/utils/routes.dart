import 'package:flutter_application_4/views/pages/home.dart';
import 'package:flutter_application_4/views/pages/login.dart';
import 'package:flutter_application_4/views/pages/dashboard.dart';
import 'package:flutter_application_4/views/pages/signup.dart';
import 'package:get/get.dart';

class Routes {
  static var routes = [
    GetPage(name: "/Login", page: () => Login()),
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/signup", page: () => signup()),
    GetPage(name: "/dashboard", page: () => Dashboard()),

  ];
}