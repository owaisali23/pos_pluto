import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: MaterialButton(
                    color: Color.fromARGB(255, 94, 182, 233),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration:  const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/googleimage.png'),
                                  ), 
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text("Sign In with Google", style: TextStyle(color: Colors.white))
                      ],
                    ),
                    // by onpressed we call the function signup function
                    onPressed: (){}
                  ),
                ),
              );
  }
}