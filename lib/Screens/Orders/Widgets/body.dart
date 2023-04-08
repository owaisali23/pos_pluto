import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/cardcart.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool? check1 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding:
    EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/21),
    // EdgeInsets.symmetric(horizontal: /*getProportionateScreenWidth*/(20)),
      child: Column(
        children:[
        Expanded(
         child: Column(
          children:[ 
           Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/30, bottom: MediaQuery.of(context).size.width/40),
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
           /* Padding(
              padding : EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Text("Add Items"),
                  const SizedBox(width: 10),
                  Container(
                        padding: EdgeInsets.all(10),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white ,
                      )
                      ),
                 /* Spacer(),
                  Text("Add Items"),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black,
                  )*/
                  ],
              ),
            ), */
        ]),  
        ),
      ],),
    );
  }
}