import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/categories.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/itemscard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black ),
          ),
        ),
        SizedBox(height: 10),
       // Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      // product: products[index],
                      // press: () {},
                    )),
          ),
        ),
      ],
    );
  }
}