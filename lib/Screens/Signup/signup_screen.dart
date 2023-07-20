import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/Widget/signup_form.dart';
import 'package:flutter_auth/Services/signupcontroller.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset : false,  
    appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(top: 10, left: 5),
             icon: const Icon(Icons.arrow_back, color: Colors.black),
             onPressed: () => Navigator.of(context).pop(),
        ),
      ),  
    body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        // SizedBox(height: 60,),
          SingleChildScrollView(
           child: Column(
           children: <Widget>[
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text( 
                      'Welcome to',
                       style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w400,fontSize: 24),
                    ),
                 
                   Text( 
                      'POS PLUTO',
                       style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 34),
                    ),
                  
               ],
             ),
            SizedBox(height: MediaQuery.of(context).size.height/15),
            Row(
              children:  [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: SignupForm(SignupController),
                ),
                Spacer(),
              ],
            ),
           /* SizedBox(height: 15,),
            OrDivider(),
            Padding(
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
              )*/
          ],
       ),
      ),
      ],
      ),
    ), 
    );
  }
}

