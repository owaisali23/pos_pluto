import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/soldModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SoldController extends GetxController {

  var isLoading = true.obs;
  var sproducts = List<SoldProductItem>().obs;

void onInit(){
  fetchSoldproducts();
  super.onInit();
}

static Future <List<SoldProductItem>> getsoldproducts() async {
  final String tokenKey = 'auth_token';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(tokenKey) ?? '';
 // var authorization = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmZDY0YjIwOC04ZTRlLTRlZmYtYjZjMy0yNDI2N2QyYjAwNmEiLCJpYXQiOjE2ODc3MDk1NTU1ODQsImV4cCI6MTY4NzcwOTY0MTk4NH0.YQCW8FgEoEqgvwnyKSocKYTlAxwzHnuGW1kBJT_RQQNnpUIvxma6Zz_lXdcAcfC6QvaI3b7FMV0wv02u84LE-4rWpcEoPiSlI7GGCn76PlFU7L_5xZbrXQc4crBqTwOAqqHhthbqgZfHrsGr4e842XJvAxNKoyl6BFeKxqEe7aNJ0ZYnQFlwEkWhtBI2bTHK4rtsc1hB4OCa0gwLzazoaMQ3Oy3zpOa1plvV3lBrdl3zOPe1IFoKJDVeGK17CGxCbM_XKkN655Ned7OBFaAnzzPKQ3eVNjk9ltIEx6oLKCs7oM_bXOMJMyEQoz7OEUQsjwwL9XSiqeDmkW8k5b7LvZJz86CNzNUMoKIKJIj-Ia2NMU0z59XMMpwB0dHNgpQ9ljQWwdv410_4zkX2lzrCwIHf_-vnIjTK_Re07I6tyoy7awrwbwUBlDyC-vG-TQbR7e7qYQm0XMIIwLchIqnWW8ntMdqnaBTNURA_yCqIAjR-pEG292xdBesCBSO8AjaSqmZt56Av5LGxhjdepo0wwtyYk6uOoIGTFLphuGD-IsNLcFTFqBkxJ3LbvoIeQsJD7HxD6-twhZvzxa9Rph3XS6J8p8fG00U8H9EHFioQWtmgJUD1lokTaSJSuyUXLEwuxf_DaYQ2NsZ1MenchnCgTcltMXQgAlKTh_T2YXF5e7g';
  if (token.isNotEmpty) {
  final response = await http.get(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/sold'),
    headers: {
            'Authorization': token,
          });
  
   print(response.statusCode);
  // print(prod);
   var jsonString = response.body;
   
   final Map<String, dynamic> data = json.decode(jsonString);
   final SoldProductResponse productResponse = SoldProductResponse.fromJson(data);
   final List<SoldProductItem> products = productResponse.result;

 //  final Map<String, dynamic> data = json.decode(jsonString);
 //  final ProductModel productResponse = ProductModel.fromJson(data);
 //  final List<Product> products = productResponse.result;//jsonDecode(response.body);
    if(response.statusCode == 200){
      return products;
    }
    else{
     print("Error");
 }
  }
  else{
     throw Exception('Token not found');
  }
} 
  
void fetchSoldproducts() async {
   try {
  isLoading(true);
  var products = await getsoldproducts();
    //print(products);
   if(products != null){
    sproducts.value = products;
    }
    else{
      print('Error');
    } }
finally {
  isLoading(false);}
     
  // }
 }
  
}

