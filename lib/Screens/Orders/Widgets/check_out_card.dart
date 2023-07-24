import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/productcartModel.dart';
import 'package:flutter_auth/Screens/Review/reviewscreen.dart';
import 'package:flutter_auth/Services/CustomerInfocontroler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
import '../../../constants.dart';
//import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
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

  String validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter customer name';
    }
    // Add additional validation if needed (e.g., check for special characters, length, etc.)
    return null; // Return null if the input is valid
  }

  String validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter customer phone number';
    }
    // Add additional validation if needed (e.g., check for non-numeric characters, length, etc.)
    return null; // Return null if the input is valid
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom ,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Customer Name',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 200,
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
                            validator: validateName,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Customer Number',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 200,
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
                                borderSide: const BorderSide(
                                  color: kPrimaryColor,
                                  width: 0.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            keyboardType: TextInputType.phone,
                            validator: validatePhoneNumber,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 190,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Colors.white,
                              backgroundColor: kPrimaryColor,
                            ),
                            onPressed: () => navigateToReviewScreen(context),
                            child: Text(
                              "Review",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
