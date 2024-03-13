import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var sum = 0.0.obs;
  var num1 = 0.0.obs;
  var num2 = 0.0.obs;
  var name = ''.obs;

  updateSum(newSum) {
    sum.value = newSum;
  }

  updateValue(a, b) {
    num1.value = a;
    num2.value = b;
  }

  updateName(newName) {
    name.value = newName;
  }
}
