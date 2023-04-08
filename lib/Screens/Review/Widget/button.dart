import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kPrimaryColor),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 16,
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white),
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          )),
                    ],
                  ),
                );
  }
}