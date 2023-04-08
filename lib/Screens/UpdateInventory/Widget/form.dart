import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_auth/Screens/UpdateInventory/Widget/productimage.dart';

import 'package:flutter_auth/Screens/UpdateInventory/Widget/dropdown.dart';
import 'package:flutter_auth/constants.dart';


class Addform extends StatelessWidget {
  const Addform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      child: Padding(
       padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(    
        child: Column(
          children: [
            const SizedBox(height: 30),          
            TextFormField(
              initialValue: "Nike Zoom Fly 5",
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Product Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.shop),
                ),
              ),
            ),
            SizedBox(height: 20),
             TextFormField(
                initialValue: '15',
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Quantity",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.numbers),
                  ),
                ),
              ),
           SizedBox(height: 20),
            TextFormField(
              initialValue: "\$150.0",
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Price",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.payments),
                ),
              ),
            ),

            SizedBox(height: 20),

            Dropdown(),

            SizedBox(height: 30),

            AddNewPlaceCard(),

          
              const SizedBox(height: 50),
                SizedBox(
                  width: /*getProportionateScreenWidth*/250,
                  height: 60,
                  child: TextButton(
                   style: TextButton.styleFrom(
                   shape:
                   RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                   primary: Colors.white,
                   backgroundColor: kPrimaryColor,
                   ),
              onPressed: (){},
              child: Text(
               "Update in Inventory",
               style: TextStyle(
               fontSize: /*getProportionateScreenWidth*/(20),
              color: Colors.white,
              ),
             ),
           ),
         ),
           const SizedBox(height: 40),
          ],
        ),
       ),
      ),
    );
  }
}
