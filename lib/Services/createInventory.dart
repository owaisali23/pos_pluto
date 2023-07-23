import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CreateInventoryController extends GetxController {
  
  // final empnameController = TextEditingController().obs;
  // final empemailController = TextEditingController().obs;
  // final emppasswordController = TextEditingController().obs;
  // final emproleController = TextEditingController().obs;

  var isLoading = false.obs; 


void AddinventApi() async{

  final String tokenKey = 'auth_token';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(tokenKey) ?? '';

  isLoading(true);
  final response = await post(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/inventory'),
  headers: {
            'Authorization': token,
          },
  body: {
           "productId": "64b96ee202c5a42f4a1fdc38",
            "count": 5,
            "price": 14000,
            "warranty": 1 
  }
  );

  // var data = jsonDecode(response.body);
  print (response.statusCode);

   if (response.statusCode == 200) {

      isLoading(false);
      print("Product Added Successfull");
      Get.snackbar("SUCCESSFULL !", "Product Added Successfull");
    // Get.to(() => EmployeesList());
}
  else {
    print (response.statusCode);
    print("Product Adding Failed");
    isLoading(false);
    Get.snackbar("Error","Please try again");
 }
}

}

