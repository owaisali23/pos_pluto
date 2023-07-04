import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Returns/Widget/body1.dart';
import 'package:flutter_auth/Screens/Returns/Widget/descript.dart';
import 'package:flutter_auth/Screens/Returns/Widget/checkoutlist.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';

class Returns extends StatelessWidget {
  const Returns({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        drawer: NavDrawer(),
        appBar: AppBar(  
        iconTheme: IconThemeData(color: Colors.white),  
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Order Returns",
                  style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.white),fontWeight:FontWeight.w600,fontSize: 20)
                ),
              ],
            )
          ],
        ), 
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),

      body: 
      SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
        child: Column(
                children: [   
                 Descript(),  
                 Body1(),
              ],),
      ),
      bottomNavigationBar: Checkoutlist(),
    
    );
  }
}