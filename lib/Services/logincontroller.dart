import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final String tokenKey = 'auth_token'; // Key to store/retrieve the token in SharedPreferences

  RxString authToken = ''.obs;
  var isLoading = false.obs; 



void LoginApi() async{

  isLoading(true);
  final response = await post(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/auth/signin'),
  body: {
    'email': emailController.value.text,
    'password': passwordController.value.text 
  }
  );

  var data = jsonDecode(response.body);
  //print (response.statusCode);
  //print (data);


   if (response.statusCode == 200) {
    // Extract the authorization token from the response headers
      final token = response.headers['authorization'];

      // Store the token in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(tokenKey, token);

      // Update the observable token variable
      authToken.value = token;
      isLoading(false);

      print("Login Successfull");
      Get.to(() => Dashboard());
}
  else {
    print("Login Failed");
    Get.snackbar("Error","Incorrect Email or Password");
 }
}

}

