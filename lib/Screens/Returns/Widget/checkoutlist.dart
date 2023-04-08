import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Returns/Widget/productlist.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
//import '../../../size_config.dart';

class Checkoutlist extends StatelessWidget {
  const Checkoutlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical:/*getProportionateScreenWidth*/(15),
          horizontal: /*getProportionateScreenWidth*/(1),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color.fromARGB(255, 216, 212, 212).withOpacity(0.2),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
          const SizedBox(
            height: 5,
          ),
               Container(
          //  padding: EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),  
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                ProductList(),
                ProductList(),
                ProductList(),
                ProductList(),
                ProductList()
              ],
            ),
          ),
          ),

          const SizedBox(
            height: 20,
          ),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                      width: /*getProportionateScreenWidth*/(190),
                      child: TextButton(
                       style: TextButton.styleFrom(
                       shape:
                       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                       primary: Colors.white,
                       backgroundColor: kPrimaryColor,
            ),
                  onPressed: (){},
                  child: Text(
                   "Return",
                   style: TextStyle(
                   fontSize: /*getProportionateScreenWidth*/(18),
                  color: Colors.white,
                  ),
                 ),
             ),
           ),
              ),
           ],),
         ),
      ),
    );
  }
}