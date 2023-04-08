import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AddNewPlaceCard extends StatelessWidget {
  const AddNewPlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 280,
      decoration: BoxDecoration(
        color: Color(0xFF6A6C93).withOpacity(0.09),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Color(0xFFEBE8F6),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 53,
            width: 53,
              
              // padding: EdgeInsets.zero,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(60),
              // ),
              // color: kPrimaryColor,
              child: Icon(
                Icons.add,
                size: 35,
                color:kPrimaryColor,
              ),
          
          ),
          Text(
            "Product Image",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}