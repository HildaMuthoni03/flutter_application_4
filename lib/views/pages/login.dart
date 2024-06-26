import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/configs/constants.dart';
import 'package:flutter_application_4/controller/logincontroller.dart';
import 'package:flutter_application_4/utils/prefs.dart';
import 'package:flutter_application_4/views/w/widgets/customText.dart';
import 'package:flutter_application_4/views/w/widgets/custombutton.dart';
import 'package:flutter_application_4/views/w/widgets/customtextfield.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

TextEditingController phoneController = TextEditingController();
TextEditingController passController = TextEditingController();
LoginController loginController=Get.put(LoginController());

    pref myprefs = pref();
String? username;
  
class Login extends StatelessWidget{
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    myprefs.getvalue("Phone").then((value) {
      username = value;
    }
    );
    phoneController.text = username??'';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
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
                  SizedBox(
                    height: 220,
                    width: 320,
                    
                  child: 
                  Image(image: AssetImage('assets/images/profle.jpg')
                  ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    label: 'Login Screen',
                    labelColor: primaryColor,
                    uFontSize: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                label: 'Phone',
              ),
              CustomTextField(
                controller: phoneController,
                hideText: false,
                icon: Icons.person,
                hint: "Enter your phone no",
              ),
              const SizedBox(
                height: 30,
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
                  remoteLogin();
                }, buttonText: '', CustomText: '',
                
              ),
              SizedBox(height: 20,),
              GestureDetector(
                child: Text("Go to Signup"),
                onTap:()=>Get.toNamed("/signup"))
            ],
          ),
        ),
      ),
    );
  }
  void gotologin(){
  myprefs.setvalue("Phone",phoneController.text);
  Get.offAndToNamed("/home");
} 
  Future<void> remoteLogin() async{
  http.Response response;
  response= await http.get(Uri.parse("https://class-26.com/clothesales/login.php?phone=0704054118&password=3693"));
  if (response.statusCode==200){
    var serverResponse = json.decode(response.body);
    int LoginStatus=serverResponse['success'];
    if (LoginStatus==1){
      var userData=serverResponse['userdata'];
      var phone=userData[0]['phone'];
      loginController.updatePhoneNumber(phone);
      Get.toNamed("/home");
    }else
    {
      print("Phone Number or Password invalid");
    }
  print("Server Error ${response.statusCode}");
  }
}

}