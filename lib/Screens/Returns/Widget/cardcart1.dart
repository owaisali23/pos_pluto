import 'package:flutter/material.dart';

import '../../../constants.dart';
//import '../../../size_config.dart';

class CartCard1 extends StatefulWidget {
 
  @override
  State<CartCard1> createState() => _CartCard1State();
}

class _CartCard1State extends State<CartCard1> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return 
        Container(
          padding: EdgeInsets.only(
            top: 15, bottom: 15, left: 15
          ),
          // height: 174,
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
          child: Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(/*getProportionateScreenWidth*/(10)),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                    fit: BoxFit.fill,
                    image:new AssetImage('assets/images/Shoes.jpg'),
                    ),
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Nike Zoom Fly 5 Premium",
                  //cart.product.title,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "\$50",
                    //"\$${cart.product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 14),
                    children: [
                      TextSpan(
                          text: "  x  3",
                          style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color.fromARGB(255, 117, 111, 111),fontSize: 10),
                          //" x${cart.numOfItem}",
                        //  style: Theme.of(context).textTheme.bodyText1),
                      ),  
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Transform.scale(
              scale: 1.1,
              child: Checkbox( 
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
                activeColor: kPrimaryColor,//only check box
                        value: isChecked, //unchecked
                        onChanged: (value){
                         
                            //value returned when checkbox is clicked
                            setState(() {
                               isChecked = value!;
                            });
                        }
              ),
            ),
          ],
        ),
        );
     
  }
}