import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/AddEmploye/Widget/form.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';


class AddEmp extends StatelessWidget {
  const AddEmp({Key? key}) : super(key: key);
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
                    "Add Employee",
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
      /* AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ), */
      body: Container(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SingleChildScrollView(
           child:Column(
               children: [
                  SizedBox(height: 45),
                   Text( 
                      'Enter Employee Details:',
                       style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 28),
                    ),
                    SizedBox(height: 30),
                    Addform()
               ],
             ),  
      ),
       ] ),
      ),);
  }
}