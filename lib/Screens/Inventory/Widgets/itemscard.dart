import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/UpdateInventory/updateinventory.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/Models/productsModel.dart';

class ItemCard extends StatelessWidget {
  final name;
  final price;
  ItemCard(String ?N, String ?P, {this.name, this.price});
  @override
  Widget build(BuildContext context) {
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
                aspectRatio: 0.83,
                child: Container(
                  //  width: 150,
                  //  height: 100,
                  //  padding: EdgeInsets.all(/*getProportionateScreenWidth*/(10)),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image:new AssetImage('assets/images/Shoes.jpg'),
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
            children: [
            Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                name!=null? name:'Default Value',
                style: TextStyle(color: Colors.black),
              ),
            ),
             Text(
                price!=null? price:'Default Value',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black ),
              ),
            ],),
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
                      "5",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.black ),
                    ),
                ),
              ),
           ],)  
            
          ],
        
        ),
      ),
    ); 
         
  }
}
