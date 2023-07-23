import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/productcartModel.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/button.dart';
import 'package:flutter_auth/Services/CustomerInfocontroler.dart';
import 'package:flutter_auth/Services/cartcontroller.dart';
import 'package:flutter_auth/Services/imagecontroller.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
//import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  String name;
  String type;
  int price;
  String id;
  String productId;
  int warranty;
  String imageUrl;


  CartCard(this.name, this.type, this.price,  this.id, this.productId, this.warranty, this.imageUrl);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
 bool isChecked = false;
 final CartController _cartController = Get.put(CartController());
 final ImageController controller = Get.put(ImageController());
 // CustomerInfoController Ccontroller = Get.put(CustomerInfoController());
 int count = 1;
 String completeUrl;

  @override
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
  Widget build(BuildContext context) {

 void onCheckboxChanged(bool value) {
      setState(() {
        isChecked = value;
      });

      final product = Product(
        widget.name,
        widget.type,
        widget.price,
        count,
        widget.id,
        widget.productId,
        widget.warranty,
        widget.imageUrl
      );

      if (value) {
        // Add the product to the cart only if it's not already in the list
        final isProductInCart = _cartController.selectedProducts.contains(product);
        if (!isProductInCart) {
          _cartController.addToCart(product);
        }
      } else {
        // Remove the product from the cart if it's in the list
        final isProductInCart = _cartController.selectedProducts.contains(product);
        if (isProductInCart) {
          _cartController.removeFromCart(product);
        }
      }
    }
  return  Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width/28,
          horizontal: MediaQuery.of(context).size.width/18,
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
          SizedBox(width:  MediaQuery.of(context).size.width/20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                 widget.name,
                 overflow: TextOverflow.ellipsis, 
                 style: TextStyle(color: Colors.black, fontSize: 14),
                ),
          
                SizedBox( height: MediaQuery.of(context).size.height/140),
                if(widget.type != null)
                Text(
                  widget.type,
                  //cart.product.title,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  maxLines: 2,
                ),
                SizedBox( height: MediaQuery.of(context).size.height/50),
                Text.rich(
                  TextSpan(
                    text: "\Rs" + widget.price.toString(),
                    //"\$${cart.product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
         Padding(
           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/33),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
            Transform.scale(
              scale: 1.1,
              child: Checkbox( 
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
                activeColor: kPrimaryColor,//only check box
                        value: isChecked, //unchecked
                        onChanged: (value){
                           onCheckboxChanged(value);
                            //value returned when checkbox is clicked
                            // setState(() {
                            //     isChecked = value;
                            // });
                        }
              ),
            ),
          //  SizedBox(height: MediaQuery.of(context).size.height/300),
            if (isChecked)
          Counter(
                    count: count,
                    onChanged: (value) {
                      setState(() {
                        count = value;
                      });

                      final product = Product(
                        widget.name,
                        widget.type,
                        widget.price,
                        count,
                        widget.id,
                        widget.productId,
                        widget.warranty,
                        widget.imageUrl
                      );

                      // Update the product count directly in the cart
                      _cartController.updateProduct(product);
                    },
                  ),






            ]),
         ),        
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final ValueChanged<int> onChanged;

  Counter({this.count, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (count > 1) {
              onChanged(count - 1);
            }
          },
          child: Icon(Icons.remove),
        ),
        SizedBox(width: 10),
        Text(count.toString()),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            onChanged(count + 1);
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Models/productcartModel.dart';
// import 'package:flutter_auth/Screens/Orders/Widgets/button.dart';
// import 'package:flutter_auth/Services/CustomerInfocontroler.dart';
// import 'package:flutter_auth/Services/cartcontroller.dart';
// import 'package:get/get.dart';

// import '../../../constants.dart';
// //import '../../../size_config.dart';

// class CartCard extends StatefulWidget {
//   String name;
//   String type;
//   int price;
//   String id;
//   String productId;
//   int warranty;

//   CartCard(this.name, this.type, this.price,  this.id, this.productId, this.warranty);

//   @override
//   State<CartCard> createState() => _CartCardState();
// }

// class _CartCardState extends State<CartCard> {
//  bool isChecked = false;
//  final CartController _cartController = Get.put(CartController());
//  // CustomerInfoController Ccontroller = Get.put(CustomerInfoController());
//  int Count = 1;

//   @override
//   Widget build(BuildContext context) {

//   void onCheckboxChanged(bool value) {
//   setState(() {
//     isChecked = value;
//   });

//   final product = Product(widget.name, widget.type, widget.price, Count, widget.id, widget.productId, widget.warranty/* Ccontroller.nameController.value, Ccontroller.nameController.value */);

//   if (value) {
//     // Add the product to the cart only if it's not already in the list
//     final isProductInCart = _cartController.selectedProducts.contains(product);
//     if (!isProductInCart) {
//       _cartController.addToCart(product);
//     }
//   } else {
//     // Remove the product from the cart if it's in the list
//     final isProductInCart = _cartController.selectedProducts.contains(product);
//     if (isProductInCart) {
//       _cartController.removeFromCart(product);
//     }
//   }
// }

//   return  Container(
//         padding: EdgeInsets.symmetric(
//           vertical: MediaQuery.of(context).size.width/28,
//           horizontal: MediaQuery.of(context).size.width/18,
//         ),
//         // height: 174,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all( Radius.circular(10) ),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(1, 3),
//                blurRadius: 8,
//               color: Color.fromARGB(255, 158, 154, 154).withOpacity(0.15),
//             )
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SizedBox(
//            width: MediaQuery.of(context).size.width/5,
           
//             child: AspectRatio(
//               aspectRatio: 0.88,
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image:new AssetImage('assets/images/Shoes.jpg'),
//                   ),
//                   color: Color(0xFFF5F6F9),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width:  MediaQuery.of(context).size.width/20),
//           Flexible(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:  [
//                 Text(
//                  widget.name,
//                  overflow: TextOverflow.ellipsis, 
//                  style: TextStyle(color: Colors.black, fontSize: 14),
//                 ),
          
//                 SizedBox( height: MediaQuery.of(context).size.height/140),
//                 Text(
//                   widget.type,
//                   //cart.product.title,
//                   style: TextStyle(color: Colors.grey, fontSize: 12),
//                   maxLines: 2,
//                 ),
//                 SizedBox( height: MediaQuery.of(context).size.height/50),
//                 Text.rich(
//                   TextSpan(
//                     text: "\$" + widget.price.toString(),
//                     //"\$${cart.product.price}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 14),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//          Padding(
//            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/33),
//            child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children:[
//             Transform.scale(
//               scale: 1.1,
//               child: Checkbox( 
//                shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5)),
//                 activeColor: kPrimaryColor,//only check box
//                         value: isChecked, //unchecked
//                         onChanged: (value){
//                            onCheckboxChanged(value);
//                             //value returned when checkbox is clicked
//                             // setState(() {
//                             //     isChecked = value;
//                             // });
//                         }
//               ),
//             ),
//           //  SizedBox(height: MediaQuery.of(context).size.height/300),
//             if (isChecked)
//             Buttons()
//             ]),
//          ),        
//         ],
//       ),
//     );
//   }
// }