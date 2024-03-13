import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/calculator_controller.dart';
import 'package:flutter_application_4/views/w/widgets/customText.dart';
import 'package:flutter_application_4/views/w/widgets/custombutton.dart';
import 'package:flutter_application_4/views/w/widgets/customtextfield.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Calculator extends StatelessWidget {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          CustomTextField(
            controller: nameController,
            hint: "Enter your Name",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: num1Controller,
            hint: "Enter Num1",
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: num2Controller,
            hint: "Enter num2",
          ),
          const SizedBox(
            height: 30,
          ),
          /* const CustomButton(
              buttonLabel: "Calculate",
            ), */
          CustomButton(
            buttonLabel: "Calculate",
            action: calculate,
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => CustomText(
              label:
                  'A is ${calculatorController.num1} B is ${calculatorController.num2} and Sum is ${calculatorController.sum}',
            ),
          ),
          Obx(() => CustomText(label: '${calculatorController.name}'))
        ],
      ),
    );
  }

  void calculate() {
    var num1 = double.parse(num1Controller.text);
    var num2 = double.parse(num2Controller.text);
    String name = nameController.text;
    var sum = num1 + num2;
    calculatorController.updateSum(sum);
    calculatorController.updateValue(num1, num2);
    calculatorController.updateName(name);
  }
}
