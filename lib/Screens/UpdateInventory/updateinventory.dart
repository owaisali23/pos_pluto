import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/UpdateInventory/Widget/form.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';


class UpdateInventory extends StatelessWidget {
  const UpdateInventory({Key key}) : super(key: key);
    AppBar buildAppBar(BuildContext context) {
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
                    "Update Inventory",
                    style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(255, 255, 255, 255)),fontWeight:FontWeight.w600,fontSize: 18)
                  ),
                ],
              )
            ],
          ),
      centerTitle: true,    
      backgroundColor: kPrimaryColor,
      actions: <Widget>[
        InkWell(
          onTap: () {
            showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Are you sure?"),
                        content: Text("Are you sure you want to delete this Product?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 221, 44, 32)), foregroundColor: MaterialStateProperty.all(Colors.white)),
                            child: Text("Delete"),
                          ),
                        ],
                      ),
                    );
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Icon(
              Icons.delete,
              size: 24,
              color: Color.fromARGB(255, 216, 38, 25) ,
            ),
          ),
        ),
     //   SizedBox(width: 20 / 2)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: NavDrawer(),
      appBar: buildAppBar(context),
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
                          'Update Product Details:',
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