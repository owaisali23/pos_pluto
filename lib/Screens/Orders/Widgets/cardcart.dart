import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/button.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
//import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  var name;
  var type;
  var price;

  CartCard(this.name, this.type, this.price);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
 bool isChecked = false;
 final CounterController _controller = Get.put(CounterController());


  @override
  Widget build(BuildContext context) {
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
        children: [
          SizedBox(
           width: MediaQuery.of(context).size.width/5,
           
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
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
          SizedBox(width:  MediaQuery.of(context).size.width/20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                widget.name,
                //cart.product.title,
                style: TextStyle(color: Colors.black, fontSize: 14),
                maxLines: 2,
              ),
              SizedBox( height: MediaQuery.of(context).size.height/140),
              Text(
                widget.type,
                //cart.product.title,
                style: TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 2,
              ),
              SizedBox( height: MediaQuery.of(context).size.height/50),
              Text.rich(
                TextSpan(
                  text: widget.price.toString(),
                  //"\$${cart.product.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 14),
                ),
              ),
            ],
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
                            //value returned when checkbox is clicked
                            setState(() {
                                isChecked = value;
                            });
                        }
              ),
            ),
          //  SizedBox(height: MediaQuery.of(context).size.height/300),
            if (isChecked)
            Buttons(),
            ]),
         ),        
        ],
      ),
    );
  }
}