import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LoginEmployer/Widget/googlebutton.dart';
import 'package:flutter_auth/Screens/LoginEmployer/Widget/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Services/logincontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/login_form.dart';

class LoginEmployerScreen extends StatelessWidget {
  const LoginEmployerScreen({Key key}) : super(key: key);

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
         // SizedBox(height: 15,),
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
            SizedBox(height: MediaQuery.of(context).size.height/10),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: LoginForm(LoginController),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/80),
            OrDivider(),
            SizedBox(height: MediaQuery.of(context).size.height/80),
            GestureDetector(
              onTap: (){ Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignupScreen();
                },
              ),
             ); },
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text('Don\'t have an account?'),
                  SizedBox(width: 5.0),
                 Text(
                'Create an account',
                 style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
          //  GoogleButton(),
          ],
       ),
      ),
      ],
      ),
    ), 
    );
  }
}

