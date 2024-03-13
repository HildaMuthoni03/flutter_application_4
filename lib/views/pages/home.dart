import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/constants.dart';
import 'package:flutter_application_4/controller/home_controller.dart';
import 'package:flutter_application_4/views/pages/calculator.dart';
import 'package:flutter_application_4/views/pages/students.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  HomeController _controller = Get.put(HomeController());

  var screens = [
    Text(
      "Home",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    Calculator(),
    Text("Notifications"),
    Student(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: [
              Icon(Icons.handshake),
              Text("Hello Hilda"),
            ],
          )),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: primaryColor,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        items: [
          Icon(Icons.home),
          Icon(Icons.calculate),
          Icon(Icons.notifications),
          Icon(Icons.person),
        ],
        onTap: (value) {
          _controller.updateSelectedPage(value);
        },
        animationDuration: Duration(milliseconds: 200),
      ),
      body: Obx(() => Center(child: screens[_controller.selectedPage.value])),
    );
  }
}
