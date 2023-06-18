import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/dashboard.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;



void LoginApi() async{
  
  final response = await post(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/auth/signin'),
  body: {
    'email': emailController.value.text,
    'password': passwordController.value.text 
  }
  );

  var data = jsonDecode(response.body);
  print (response.statusCode);
  print (data);


   if (response.statusCode == 200) {
     print("Login Successfull");
     Get.to(() => Dashboard());
}
  else {
    print("Login Failed");
    Get.snackbar("Error","Incorrect Email or Password");
 }

}

}

