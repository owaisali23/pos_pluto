import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Review/Widget/body.dart';
import 'package:flutter_auth/Screens/Review/Widget/check_out_card.dart';
import 'package:flutter_auth/Services/cartcontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/productcartModel.dart';
import '../../navdrawer.dart';
//import 'package:shop_app/models/Cart.dart';


class ReviewScreen extends StatelessWidget {
   final CartController _cartController = Get.put(CartController());
    final List<Product> selectedProducts;
    ReviewScreen({ this.selectedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Review Cart",
                  style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 20)
                ),
               if (selectedProducts != null && selectedProducts.isNotEmpty)
                  Text(
                    selectedProducts.length.toString() + " items",
                    style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(221, 76, 78, 78)),fontWeight:FontWeight.w600,fontSize: 14),
                  ),
              ],
            )
          ],
        ), 
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Body(),
      bottomNavigationBar: CheckoutCard(selectedProducts: _cartController.selectedProducts),
    );
  }
}