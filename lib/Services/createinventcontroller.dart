import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CreateInventController extends GetxController {
  
  final prodIdController = TextEditingController().obs;
  final prodcountController = TextEditingController().obs;
  final prodpriceController = TextEditingController().obs;
  final prodwarrantyController = TextEditingController().obs;

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
  //  'productId': productId,
  //  'count': count,
  //  'price': price,
  //  'warranty': warranty,
  }
  );

  var data = jsonDecode(response.body);
  print (response.statusCode);

   if (response.statusCode == 200) {

      isLoading(false);
      print("Inventory Added Successfull");
      Get.snackbar("SUCCESSFULL !", "NEW Product ADDED");
    // Get.to(() => EmployeesList());
}
  else {
    print("Failed To Add Product");
    isLoading(false);
    Get.snackbar("Error","Please try again");
 }
}

}
