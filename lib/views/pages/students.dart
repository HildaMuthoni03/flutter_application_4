import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/constants.dart';

var icon = [Icons.abc, Icons.abc_rounded];

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  splashColor: appWhite,
                  
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor.withOpacity(0.5),
                    ),
                    height: 200,
                    width: 300,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dangerous,
                          size: 60,
                        ),
                        Text(
                          "Dangerous",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
