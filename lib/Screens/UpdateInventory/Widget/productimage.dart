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
          Container(
                    width: 180,
                   height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                    fit: BoxFit.cover,
                    image:new AssetImage('assets/images/Shoes.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
        ],
      ),
    );
  }
}