// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  var height;
  var width;

List imgData = [
  "assets/images/profle.jpg",
  "assets/images/top.jpg",
  "assets/images/hood.jpg",
  "assets/images/sizes.jpg",
  "assets/images/logo.jpg",
  "assets/images/poster.jpg",
];

List titles = [
  "profle",
  "top",
  "hood",
  "sizes",
  "logo",
  "poster",
];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: height,
              width : width,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                ),
              height: height * 0.25,
              width : width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: EdgeInsets.only(
                  top: 35,
                  left: 20,
                  right: 20,

                  ),
                  child: Row(
                    children: [
                    InkWell(
                      onTap: (){},
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius :BorderRadius.circular(15),
                          color: Colors.white,
                          image : DecorationImage(
                               image: AssetImage(
                           'assets/images/profle.jpg'
                          ),
                      ),
                    ),
                    ),
                  ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                  top: 20,
                  left: 30,

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      ),
                      SizedBox(height: 10,),
                       Text(
                        "Last update: 6th March 2024",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                        letterSpacing: 1,
                      ),
                      )
                    ],
                  ),
                )
              ],
              ),
            ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              height: height * 0.75,
              width : width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                           childAspectRatio: 1.1,
                                         mainAxisSpacing: 25,
                ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imgData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(imgData[index],
                width: 100,
                ),
              ],
            ),
          ),
        );
      },
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}