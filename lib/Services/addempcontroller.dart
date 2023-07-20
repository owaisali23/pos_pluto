import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Employees/employeeslist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AddempController extends GetxController {
  
  final empnameController = TextEditingController().obs;
  final empemailController = TextEditingController().obs;
  final emppasswordController = TextEditingController().obs;
  final emproleController = TextEditingController().obs;

  var isLoading = false.obs; 


void AddempApi() async{

  final String tokenKey = 'auth_token';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(tokenKey) ?? '';

  isLoading(true);
  final response = await post(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/users/employees'),
  headers: {
            'Authorization': token,
          },
  body: {
    'name': empnameController.value.text,
    'email': empemailController.value.text,
    'password': emppasswordController.value.text,
    "role": emproleController.value.text
  }
  );

  var data = jsonDecode(response.body);
  print (response.statusCode);

   if (response.statusCode == 200) {

      isLoading(false);
      print("Empolyee added Successfull");
      Get.snackbar("SUCCESSFULL !", "NEW EMPLOYEE ADDED");
    // Get.to(() => EmployeesList());
}
  else {
    print("Employee Adding Failed");
    isLoading(false);
    Get.snackbar("Error","Please try again");
 }
}

}

