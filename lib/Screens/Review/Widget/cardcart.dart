import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Review/Widget/button.dart';
import 'package:flutter_auth/Services/cartcontroller.dart';
import 'package:flutter_auth/Services/imagecontroller.dart';
import 'package:get/get.dart';

import '../../../Models/productcartModel.dart';
import '../../../constants.dart';
//import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  String name;
  String type;
  int price;
  int count;
  String id;
  String productId;
  int warranty;
  String imageUrl;


  CartCard(this.name, this.type, this.price, this.count,this.id, this.productId ,this.warranty, this.imageUrl /*this.custname, this.phone*/);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  String completeUrl;
   void initState() {
    super.initState();
    // Fetch the image URL using ImageController only once in initState
    controller.imageApi(widget.imageUrl).then((url) {
      setState(() {
        completeUrl = url;
      });
    }).catchError((error) {
      // Handle error if needed
      print('Error fetching image URL: $error');
    });
  }
  final CartController _cartController = Get.put(CartController());

  final ImageController controller = Get.put(ImageController());

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,  
        children: [
         SizedBox(
           width: MediaQuery.of(context).size.width/5,
           child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                               // color: Colors.grey, // Placeholder color for the image
                              ),
                            ),
                             FutureBuilder<String>(
                              future: controller.imageApi(widget.imageUrl),
                          builder: (context, snapshot) {
          if (completeUrl == null) {
            // Show a placeholder or loading widget until the image URL is fetched
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(completeUrl),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            );
          }
        },
      ),
                          ],
                        ),
                      ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  widget.name ?? ' ',
                  overflow: TextOverflow.ellipsis,
                  //cart.product.title,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  maxLines: 2,
                ),
                Text(
                  widget.type ?? ' ',
                  //cart.product.title,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "\$" + widget.price.toString(),
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
                    final product = Product(widget.name, widget.type, widget.price, widget.count, widget.id, widget.productId, widget.warranty, widget.imageUrl);

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
              Text(widget.count.toString()),
            ],
          ),
        ],
      ),
       ]),
      );
  }
}