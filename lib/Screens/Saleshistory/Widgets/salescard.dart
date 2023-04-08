import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SalesCard extends StatelessWidget {
  const SalesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 100.0,
    margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(12),
      //set border radius more than 50% of height and width to make circle
  ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  'assets/images/Shoes.jpg',
                  height: 60.0,
                  width: 60.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Receipt Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                      ),
                    //  Text(history.receiverName)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '\$150.0',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Cash \n 15/2/23',
                              textAlign: TextAlign.right,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                          //   child: Image.asset(
                          //     history.cardLogoPath,
                          //   ),
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}