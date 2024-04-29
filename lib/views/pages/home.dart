import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/home_controller.dart';
import 'package:flutter_application_4/views/pages/dashboard.dart';
import 'package:flutter_application_4/views/pages/orders.dart';
import 'package:flutter_application_4/views/pages/products.dart';
import 'package:flutter_application_4/views/pages/profile.dart';
import 'package:get/get.dart';
HomeController homeController=Get.put(HomeController());
var screenList=[
  Dashboard(),
  Orders(),
  Profile(),
  Products(),
];

// ignore: must_be_immutable
class Home extends StatelessWidget {
 const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(197, 110, 94, 3),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromARGB(197, 110, 94, 3),
        items: const[
        CurvedNavigationBarItem(child: Icon(Icons.home,color: Colors.white,)),
        CurvedNavigationBarItem(child: Icon(Icons.category,color: Colors.white,)),
        CurvedNavigationBarItem(child: Icon(Icons.history,color: Colors.white)),
        CurvedNavigationBarItem(child: Icon(Icons.person,color: Colors.white)),
      ],
      onTap: (index){
        homeController.updateSelectedPage(index);
      },
      ),
      body: Obx(()=>Container(
        child: screenList[homeController.selectedPage.value]
      ),
    ));
  }
}
