import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/Widget/circularchart.dart';
import 'package:flutter_auth/Screens/Dashboard/Widget/columnchart.dart';
import 'package:flutter_auth/Screens/Dashboard/Widget/columnchart2.dart';
import 'package:flutter_auth/Screens/Dashboard/Widget/line.dart';
import 'package:flutter_auth/Screens/Dashboard/Widget/linechart.dart';
import 'package:flutter_auth/Screens/Dashboard/models.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:my_app/utlity/colors.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      drawer: NavDrawer(),
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dashboard",
                  style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.white),fontWeight:FontWeight.w600,fontSize: 18)
                ),
              ],
            )
          ],
        ), 
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ), 
      body:
       Column(
       // mainAxisSize: MainAxisSize.min,
       // crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.start,
        children: [
            SizedBox(height: 8),
            Column(
             children: [
              ColumnChart(),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                   //mainAxisAlignment: MainAxisAlignment.start, 
                   children: [
                    Line(),
                    ColumnChart2(),
                   // LineChart(),
                   ],),
                ),
                Container
                  ( 
                    height: 280,
                    child: CircularChart()),
            ],)

        ],
      ),
    );
  }

}