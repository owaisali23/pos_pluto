import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth/Screens/Returns/Widget/checkoutlist.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
            Container(
            child: Card(
                  child: ConstrainedBox( constraints: BoxConstraints(minHeight: 30,minWidth: 55),
                  child: Align( alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text( 'Product', style: TextStyle(color: Colors.white)),
                      )),),
                    color: Color.fromARGB(255, 235, 95, 95),
                    shape:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1)
                    ),
                  ),
            );
  }
}
