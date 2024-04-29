import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/constants.dart';
import 'package:flutter_application_4/views/pages/login.dart';
import 'package:flutter_application_4/views/w/widgets/customText.dart';
import 'package:flutter_application_4/views/w/widgets/custombutton.dart';
import 'package:flutter_application_4/views/w/widgets/customtextfield.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

TextEditingController phone=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController firstname=TextEditingController();
TextEditingController secondname=TextEditingController();

class signup extends StatelessWidget {
  const signup({super.key});
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: primaryColor,
        foregroundColor: appWhite,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                ]
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    label: 'Create Account',
                    labelColor: primaryColor,
                    uFontSize: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
               const CustomText(label: 'first name'),
              CustomTextField(
                controller: passController,
              ),
              const SizedBox(
                height: 20,
              ),
               const CustomText(label: 'second name'),
              CustomTextField(
                controller: passController,
              ),
              const SizedBox(
                height: 20,
              ),
               const CustomText(label: 'phone'),
              CustomTextField(
                controller: passController,
              ),
              const CustomText(label: 'Password'),
              CustomTextField(
                controller: passController,
                hideText: true,
                isPassword: true,
                icon: Icons.lock,
                hint: "Password",
              ),
              const SizedBox(
                height: 10,
              ),
              
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                buttonLabel: "Login",
                action: () {
                serverSignup();
                }, buttonText: '', CustomText: '',
                
              ),
              SizedBox(height: 20,),
              GestureDetector(
                child: Text("Go to Login"),
                onTap:()=>Get.toNamed("/Login"))
            ],
          ),
        ),
      ),
    );

}
Future<void>serverSignup()  async{
  http.Response response;
 var body = {
  'firstname': firstname.text.trim(),
  'secondname': secondname.text.trim(),
  'phone': phone.text.trim(),
  'password': password.text.trim(),
};
   response= await http.post(Uri.parse("https://class-26.com/clothesales/signup.php?"), body:body);
   if(response.statusCode==200){
    var serverResponse=json.decode(response.body);
    int signedup=serverResponse['success'];
    if(signedup==1){
      Get.offAndToNamed("/Login");
    }
   }
}
}