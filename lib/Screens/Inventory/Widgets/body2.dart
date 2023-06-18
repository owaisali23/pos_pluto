import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/categories.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/itemscard.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/Models/productsModel.dart';

class Body extends StatelessWidget {
 Future <productsModels> getproduct() async {
   var authorization = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NzRlMTM5OS1lMDNkLTQzN2EtYTY0YS0yYzhiMGJiMTlmMWIiLCJpYXQiOjE2ODcwMzI1NzUzMDcsImV4cCI6MTY4NzAzMjY2MTcwN30.L6XCFYCIzK0eO5abXe7vpa_7R7MVptgCP2v6KvSjg4uMipcguC_JsE9kK0_-T1a6CIzTJ-M8WLyrot8AUQQwKm3sbqKtUgxER6UdyHNc_ACh-eX4VRTWZMQ_HW9HfhcpBxD77__-ayFeZL4MlYQh8mLIjhPrkY79RaqN8Vj--JwSnnCREumHuDwS1tBKoyouccVv9t2VfVaEx4JH4FhrTXc5GkF3jePKi_DB71XY8JQBzJV3gYGFcmB1uXMvrDb1wT0rT1vBE12tHVEOXwhLQL6ffS3Fmn_a6rrKkB3TldswLwHheW70AKKg9Ww08CYs4UDxscBvOGXMka5UhBETEvNNK7d7wTikQFAQ5Y-BPtFeHmPTSaAfqpEDbHMX8IxfdRWtp_I_A2NhRni3Gzk-YIx__aEYmmtHSqDq6E025eTzhCIzn_N8jJnsiA92RRxn0R-XwiQ8VN5EWPUGgK1wkB-KgTNxl0up3Pcksaw5o7tCi_zIKkeGLdLOGhT1G105bjAnCD_aD9U8WCDwf2TpjzlxsV6se7m4lfebo3sMar7NlUGm2N8TkPO2zSmYMjutf1aksNA-a8_HC0M19XJkDf9nD2iOscjA2eMyNee-zYPwcU2cQCO7QrdgF6OPMI7JhSBYLzuI4dCfMk8M4GCYiek1NMYen0HldyyFg1ED198';
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
 }


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
     FutureBuilder<productsModels>(
      future: getproduct(),
      builder: (context, snapshot){
       if(snapshot.hasData){
        return
       // Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
                itemCount: snapshot.data!.result!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      snapshot.data?.result?[index].name.toString(),
                      snapshot.data?.result?[index].price.toString()
                      
                    )
                    ),
          ),
        );        
       }
    else{
     return Text("Loading");
   }  
     
    }
    ),
      ],
    );
  }
}
