import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Review/Widget/button.dart';
import 'package:flutter_auth/Screens/Review/Widget/cardcart.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
           ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
            shrinkWrap: true,
            itemCount: 3,//demoCarts.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: 
              CartCard(/*cart: demoCarts[index]*/),
             ),
            ),
        ]),  
        ),
      ],),
    );
  }
}