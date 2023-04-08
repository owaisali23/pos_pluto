import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Returns/Widget/cardcart1.dart';
import 'package:flutter_auth/Screens/Returns/Widget/descript.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
       EdgeInsets.symmetric(horizontal: /*getProportionateScreenWidth*/(20)),
        child: Column(
          children:[
             Column(
             children:[ 
            // Descript(),
             Container(
            padding: EdgeInsets.only(top: 18, bottom: 12),
            alignment: Alignment.centerLeft,
             child: Text( 
              'Category:',
               style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 18),
          ),
           ),
            ListView.builder(
            physics: NeverScrollableScrollPhysics(),  
            shrinkWrap: true,
            itemCount: 5,//demoCarts.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: 
              CartCard1(/*cart: demoCarts[index]*/),
             ),
            ),
          ]),  
        ],),
    );
  }
}