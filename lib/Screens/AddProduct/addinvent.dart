import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/AddProduct/Widget/form.dart';
import 'package:flutter_auth/Screens/AddProduct/Widget/productimage.dart';
import 'package:flutter_auth/Screens/AddProduct/Widget/form.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';


class AddProduct extends StatelessWidget {
  const AddProduct({Key key}) : super(key: key);
    AppBar buildAppBar() {
    return AppBar(
      title: 
       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add Product",
                    style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(255, 255, 255, 255)),fontWeight:FontWeight.w600,fontSize: 18)
                  ),
                ],
              )
            ],
          ),
      centerTitle: true,    
      backgroundColor: kPrimaryColor,
     /* elevation: 0,
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
      ],*/
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: NavDrawer(),
      appBar: buildAppBar(),
      body: 
      
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 10,),
          SingleChildScrollView(
           child:Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
             child: Container(
          //     decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 255, 255, 255),
          //     borderRadius: BorderRadius.all( Radius.circular(10) ),
          //     boxShadow: [
          //       BoxShadow(
          //         offset: Offset(10, 10),
          //         blurRadius: 20,
          //         color: Color.fromARGB(255, 158, 154, 154).withOpacity(0.15),
          //       )
          //     ],
          // ),
               child: Column(
                   children: [
                       SizedBox(height: 30),
                       Text( 
                          'Enter Products Details:',
                           style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 24),
                        ),
                        SizedBox(height: 25),
                        // AddNewPlaceCard(),
                        Addform(),
                        
                   ],
                 ),
             ),
           ),  
      ),
       ] ),
      ),);
  }
}