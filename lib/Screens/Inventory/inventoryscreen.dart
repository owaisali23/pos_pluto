import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/body2.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      drawer: NavDrawer(),
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
       title: 
       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
     [
                  Text(
                    "Products Inventory",
                    style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(255, 255, 255, 255)),fontWeight:FontWeight.w600,fontSize: 16)
                  ),
                ],
              )
            ],
          ),
      centerTitle: true,    
      backgroundColor: kPrimaryColor,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.search,
            size: 24,
            color: Colors.white ,
          ),
        ),
     //   SizedBox(width: 20 / 2)
      ],
    );
  }
}