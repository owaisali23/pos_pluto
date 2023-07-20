import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/UpdateInventory/updateinventory.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/Models/productsModel.dart';

class ItemCard extends StatelessWidget {
  var name;
  var category;
  String imageUrl;
  String id;
  int count;
  int price;


  ItemCard(this.name, this.category, this.imageUrl, this.id, this.count, this.price );
  @override
  Widget build(BuildContext context) {
    String image = "http://" + imageUrl;
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10, right: 2,left: 2),
      child: Container(
        padding: EdgeInsets.only(bottom: 10,),
        decoration: BoxDecoration(
           color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(10) ),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 3),
                blurRadius: 8,
                color: Color.fromARGB(255, 158, 154, 154).withOpacity(0.15),
              )
            ],
          ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
               padding: EdgeInsets.all(10),  
              child: SizedBox(
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                AspectRatio(
                aspectRatio: 0.75,
                child: Container(
                  //  width: 150,
                  //  height: 100,
                  //  padding: EdgeInsets.all(/*getProportionateScreenWidth*/(10)),
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(image),
                   ),
                   // color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
                InkWell(
                  onTap: (() {
                       Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UpdateInventory();
                },
              ),
             );
                  }),
                  child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                  Icons.edit,
                                  size: 12,
                                  color: Colors.white ,
                                )
                                ),
              ), 
           ],),
          ), ),
         ),
        Row( 
          mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Padding(
                padding: const EdgeInsets.only(left:6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                           // Padding(
                //  padding: const EdgeInsets.symmetric(horizontal: 14),
                  Text( 
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
                  ),
                           // ),
                 Text(
                    category,
                    style: TextStyle( color: Colors.black, fontSize: 11 ),
                  ),
                  Text(
                    "Rs:" + price.toString() + "/-",
                    style: TextStyle( fontWeight: FontWeight.bold,color: Colors.black, fontSize: 11 ),
                  ),
                ],),
              ),
             // SizedBox(width: 20),
              Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                     color: kPrimaryLightColor,
                       borderRadius: BorderRadius.circular(5),
                     ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                        count.toString(),
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.black ),
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
