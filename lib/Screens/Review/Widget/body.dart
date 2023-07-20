import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Review/Widget/cardcart.dart';
import 'package:flutter_auth/Screens/Review/Widget/check_out_card.dart';
import 'package:flutter_auth/Services/cartcontroller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../size_config.dart';

class Body extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());
  
  @override

  Widget build(BuildContext context) {
   return Padding(
    padding:
     EdgeInsets.symmetric(horizontal: /*getProportionateScreenWidth*/(20)),
      child: Column(
        children:[
        Expanded(
          child: Column(
           children:[ 
           Container(
          padding: EdgeInsets.only(top: 18, bottom: 12),
          alignment: Alignment.centerLeft,
           child: Text( 
            'Category:',
             style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 18),
        ),
         ), 
        // CheckoutCard(selectedProducts: _cartController.selectedProducts),
         Obx(() {
             return ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
            shrinkWrap: true,
            itemCount: _cartController.selectedProducts.length,//demoCarts.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: 
              CartCard(_cartController.selectedProducts[index].name,
                       _cartController.selectedProducts[index].type,
                       _cartController.selectedProducts[index].price,
                      _cartController.selectedProducts[index].count,
                       _cartController.selectedProducts[index].id,
                       _cartController.selectedProducts[index].productId,
                       _cartController.selectedProducts[index].warranty,
                       _cartController.selectedProducts[index].imageUrl

                      // _cartController.selectedProducts[index].custname,
                      // _cartController.selectedProducts[index].phone,
                       
              ),
             ),
            );
           },), 
        ]),  
        ),
      ],),
    );
  }
}