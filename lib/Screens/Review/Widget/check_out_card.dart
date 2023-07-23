import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/productcartModel.dart';
import 'package:flutter_auth/Services/CustomerInfocontroler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
//import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
   
  final List<Product> selectedProducts; // Assuming Product is a model class for your product data.
  CheckoutCard({this.selectedProducts});

  CustomerInfoController Ccontroller = Get.put(CustomerInfoController());
  var isLoading = false.obs; 


  void sendCheckoutRequest() async {
  final String tokenKey = 'auth_token';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(tokenKey) ?? '';

  if (selectedProducts.isEmpty) {
    Get.snackbar("Error","No products selected");
    return;
  }

  final List<Map<String, dynamic>> inventoryData = selectedProducts
      .map((product) => {
            'id': product.id,
            'count': product.count,
            'price': product.price,
            'warranty': product.warranty,
            'productId': product.productId,
          })
      .toList();

  if (inventoryData.isEmpty) {
    print("Inventory data is empty.");
    return;
  }

  final Map<String, dynamic> requestBody = {
    'name': Ccontroller.CustnameController.text,
    'phone': Ccontroller.CustphoneController.text,
    'inventoryData': inventoryData, 
  };

  isLoading(true);
  final response = await http.post(
    Uri.parse('https://pos-pluto-server.vercel.app/api/v1/inventory/sell'),
    headers: {
      'Authorization': token,
      'Content-Type': 'application/json'
    },
    body: jsonEncode(requestBody),
  );

  var data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    print(jsonEncode(requestBody));
    print(response.statusCode);
    isLoading(false);
    print("Checkout Successful");
    Get.snackbar("SUCCESSFULL!", "Checkout Successful");
    // Perform any additional actions after a successful checkout, if needed.
  } else {
    print(jsonEncode(requestBody));
    print(response.body);
    print("Checkout Failed");
    isLoading(false);
    Get.snackbar("Error", "Checkout failed. Please try again.");
  }
}


  @override
  Widget build(BuildContext context) {
   int totalAmount = selectedProducts?.fold(0, (sum, product) => sum + (product.price * product.count)) ?? 0;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical:/*getProportionateScreenWidth*/(15),
        horizontal: /*getProportionateScreenWidth*/(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: /*getProportionateScreenHeight*/(20)),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( 
                          'Customer Name',
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                        ),
                     Text( 
                          Ccontroller.CustnameController.text,
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 14),
                        ),
                  ],
                ),
                SizedBox(height: /*getProportionateScreenHeight*/(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( 
                          "Customer Phone Number",
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                        ),
                     Text( 
                           Ccontroller.CustphoneController.text,
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 14),
                        ),
                  ],
                ),  
            SizedBox(height: /*getProportionateScreenHeight*/(30)),      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                       text: "\Rs$totalAmount", // Display the calculated total amount
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),)
                    ],
                  ),
                ),
            Obx(() {
            if(isLoading.value == true){
              return Center(child: CircularProgressIndicator());}
            else{
              return 
              SizedBox(
                  width: /*getProportionateScreenWidth*/(190),
                  child: TextButton(
                   style: TextButton.styleFrom(
                   shape:
                   RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                   primary: Colors.white,
                   backgroundColor: kPrimaryColor,
                   ),
              onPressed: () {
                sendCheckoutRequest();
              },
              child: Text(
               "Checkout",
               style: TextStyle(
               fontSize: /*getProportionateScreenWidth*/(18),
              color: Colors.white,
              ),
             ),
           ),
         );
           }
        },
        ),
         ],),
        ],
       ),
      ),
    );
  }
}