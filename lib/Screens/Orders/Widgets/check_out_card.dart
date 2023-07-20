import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Review/reviewscreen.dart';
import 'package:flutter_auth/Services/CustomerInfocontroler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
import '../../../constants.dart';
//import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
   CheckoutCard({
    Key  key,
  }) : super(key: key);
  CustomerInfoController Ccontroller = Get.put(CustomerInfoController());

     void navigateToReviewScreen(BuildContext context) {
    String custName = Ccontroller.CustnameController.text;
    String custPhone = Ccontroller.CustphoneController.text;

    if (custName.isEmpty || custPhone.isEmpty) {
      // Show a dialog or a snackbar indicating that name and number are required.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Missing Information"),
            content: Text("Please add customer name and number."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Both name and number are not empty, navigate to ReviewScreen.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewScreen()),
      );
    }
  }

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
                    SizedBox(
                  width: 200, // Adjust the width as needed
                  child: TextFormField(
                    controller: Ccontroller.CustnameController,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: kPrimaryColor),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter customer name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    // You can add controller and other properties if needed
                  ),
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
                      SizedBox(
                  width: 200, // Adjust the width as needed
                  child: TextFormField(
                    controller: Ccontroller.CustphoneController,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: kPrimaryColor),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter customer number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: kPrimaryColor, width: 0.0),
                        
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    // You can add controller and other properties if needed
                  ),
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
                        style: TextStyle(fontSize: 16,fontWeight:FontWeight.w700, color: Colors.black),
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
              onPressed: () => navigateToReviewScreen(context),
              child: Text(
               "Review",
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