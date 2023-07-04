import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/categories.dart';
import 'package:flutter_auth/Services/productscontroller.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/itemscard.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/Models/productsModel.dart';


class Body extends StatelessWidget {
 /*Future <productsModels> getproduct() async {
   var authorization = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyZmNlMDNjOS05YjNkLTQyYjEtYjBmZC03YmZjMzgwYTE1NjQiLCJpYXQiOjE2ODcwODk5NDA5OTksImV4cCI6MTY4NzA5MDAyNzM5OX0.fIADtyenhLzfhi6DJEcWGPFYRnRWBYkUUAHfZWmkD6tQkU2_hIFI88bthIxqqMECzRu9-ObYGEzQmZGethTrJse0rZ9OTO1Utbdnl_uIRgZoVuGapuFHiRWiNOrS2z85TYT8hFoc4KKzswOjAvA4WthZbUHm8vrB3BeFSrA2UFz4pcE12D5ZIQ2Z9C1_nhqOks3vwtycbMlrdunzwaa1DJOE3qicE-7796f6HgplEDJcJa4DZySWEvUtI7VznN4F8SQabjz-gLELTMcjqBTN0zyiUxTbdshlUH9_8U_dJvNrME2vGNCOPQe5ca-UThaDLZhNQI16shmQfP0lyl-0J9HfPZ3Ps1AKglNPKZiQVetn-oL8YK2yGfjvDLMF2w6yOb5KFYgLzsuv4CmPJrrZb12F1qFlT2T9sjYDEyX3Zx9bqPYIpBeDF-u6C2ETmeU-G7qdOJZ2ARWh0airLi0urd-ATncEVJWgMmhZa_qM6qobAcDnmoUj1XmObZDAcnHpjghfAatame5CpbqxTnNp6tnBCSUoO7yyksIRxzBGE-m1VO4T4_mVJ0rHVxw0BmzusORSyhjVoLfIljOIqmUm4uUi5h5CL3OLUiAg9ieKaO0L7gR56vcCKMdu5MLTAoTGfuO_EpFCnzTxJmHWTC9qzCrTcW-oeCwkj8faT9ZqT6I';
   final response = await http.get(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/products'),
    headers: {
            'Authorization': authorization,
          });
   print(response.statusCode);
   var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return productsModels.fromJson(data);
    }
    else{
      return productsModels.fromJson(data);
    }
 } */

 final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
             "Categories",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black ),
            ),
            
          ),
          SizedBox(height: 10),
       //  FutureBuilder<productsModels>(
      //  future: getproduct(),
      //  builder: (context, snapshot){
       // if(snapshot.hasData){
        //  return //Text(snapshot.data.result[1].name.toString());
        //  Categories(),
          Expanded(
            child:
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: 
              Obx(() {
                    if(controller.isLoading.value == true){
                    return Center(child: CircularProgressIndicator());}
                    else{
                   return GridView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
                  itemCount: controller.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) =>ItemCard( controller.productList[index].name,
                    controller.productList[index].categoryName     
                   ), 
                  );
                  }
              },),
                  
              ),  
            ), 
        ], 
      );
  }
}
