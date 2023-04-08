import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
//import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
           /* Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: /*getProportionateScreenWidth*/(40),
                  width: /*getProportionateScreenWidth*/(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                )
              ],
            ),*/
            SizedBox(height: /*getProportionateScreenHeight*/(20)),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( 
                          'Customer Name',
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                        ),
                     Text( 
                          'Sample Name',
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 14),
                        ),
                  ],
                ),
                SizedBox(height: /*getProportionateScreenHeight*/(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( 
                          'Customer Number',
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                        ),
                     Text( 
                          'Sample Number',
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
                        text: "\$150.0",
                        style: TextStyle(fontSize: 16, fontWeight:FontWeight.w700, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                  width: /*getProportionateScreenWidth*/(190),
                  child: TextButton(
                   style: TextButton.styleFrom(
                   shape:
                   RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                   primary: Colors.white,
                   backgroundColor: kPrimaryColor,
                   ),
              onPressed: (){},
              child: Text(
               "Checkout",
               style: TextStyle(
               fontSize: /*getProportionateScreenWidth*/(18),
              color: Colors.white,
              ),
             ),
           ),
         ),
         ],),
        ],
       ),
      ),
    );
  }
}