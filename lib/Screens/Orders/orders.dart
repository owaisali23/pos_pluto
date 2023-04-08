import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/body.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/check_out_card.dart';
//import 'package:flutter_auth/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navdrawer.dart';
//import 'package:shop_app/models/Cart.dart';


class OrderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/150),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Orders",
                  style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 20)
                ),
                Text(
                  "3 items",
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
        actions: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width/40),
            child: IconButton(
              onPressed: () {
                // method to show the search bar
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
  ),

    body:       
      Body(),

      bottomNavigationBar: CheckoutCard(),
    );
  }
}