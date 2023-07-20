import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LoginEmployer/login_screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SignupController extends GetxController {
  
  final storenameController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final String tokenKey = 'auth_token'; // Key to store/retrieve the token in SharedPreferences

  RxString authToken = ''.obs;
  var isLoading = false.obs; 



void SignUpApi() async{

  isLoading(true);
  final response = await post(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/auth/signup'),
  body: {
    'storeName': storenameController.value.text,
    'storeDescription': descriptionController.value.text,
    'name': nameController.value.text,
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

      print("User Registered Successfull");
      Get.to(() => LoginEmployerScreen());
}
  else {
    print("SignUp Failed");
    isLoading(false);
    Get.snackbar("Error","SignUp Failed");
 }
}

}

