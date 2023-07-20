import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Review/Widget/button.dart';
import 'package:flutter_auth/Services/cartcontroller.dart';
import 'package:get/get.dart';

import '../../../Models/productcartModel.dart';
import '../../../constants.dart';
//import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  String name;
  String type;
  int price;
  int count = 1;
  String id;
  String productId;
  int warranty;
  String imageUrl;

  final CartController _cartController = Get.put(CartController());

  CartCard(this.name, this.type, this.price, this.count,this.id, this.productId ,this.warranty, this.imageUrl /*this.custname, this.phone*/);
  @override

  Widget build(BuildContext context) {
    return 
      Container(
        padding: EdgeInsets.symmetric(
          vertical:/*getProportionateScreenWidth*/(15),
          horizontal: /*getProportionateScreenWidth*/(15),
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
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Row(
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
                  image: NetworkImage(imageUrl),
                  ),
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  //cart.product.title,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  maxLines: 2,
                ),
                Text(
                  type,
                  //cart.product.title,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "\$" + price.toString(),
                    //"\$${cart.product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
         Column(
            children: [
              GestureDetector(

                onTap: () { 
                    final product = Product(name, type, price, count, id, productId, warranty, imageUrl);

                  _cartController.removeFromCart(product);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, bottom: 65),
                  child: Container(
                                  padding: EdgeInsets.all(4),
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 221, 40, 27),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                  Icons.close,
                                  size: 14,
                                  color: Colors.white ,
                                )
                                ),
                ),
              ),
              Text(count.toString()),
            ],
          ),
        ],
      ),
       ]),
      );
  }
}