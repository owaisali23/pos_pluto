import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AddProductController extends GetxController {
  final pordNameController = TextEditingController().obs;
  final prodCategoryController = TextEditingController().obs;
  final prodTypeController = TextEditingController().obs;
  final prodBrandController = TextEditingController().obs;
  final prodModalController = TextEditingController().obs;
  final prodYearController = TextEditingController().obs;

  var isLoading = false.obs;
  final productImage = ''.obs;

  void AddprodApi() async {
    final String tokenKey = 'auth_token';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey) ?? '';

    isLoading(true);
    final response = await post(
      Uri.parse('https://pos-pluto-server.vercel.app/api/v1/products'),
      headers: {
        'Authorization': token,
      },
      body: {
        "name": pordNameController.value.text,
        "category": prodCategoryController.value.text,
        "image": productImage.value, // Use the productImage base64 string here
        "content": {
          "type": prodTypeController.value.text,
          "brand": prodBrandController.value.text,
          "modal": prodModalController.value.text,
          "year": prodYearController.value.text,
        },
      },
    ).timeout(
        // Set the desired timeout duration in milliseconds (adjust as needed).
        Duration(seconds: 300),
        onTimeout: () {
          throw TimeoutException('Timeout occurred');
        },
      );

    print(response.statusCode);

    if (response.statusCode == 200) {
      isLoading(false);
      print("Product Added Successfully");
      Get.snackbar("SUCCESSFULL!", "NEW Product ADDED");
      // Get.to(() => EmployeesList());
    } else {
      print(response.statusCode);
      print("Failed To Add Product");
      isLoading(false);
      Get.snackbar("Error", "Please try again");
    }
  }

  void setProductImage(String base64string) {
    productImage.value = base64string; // Assign the received base64 string to productImage
  }
}
