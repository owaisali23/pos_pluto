import 'package:flutter/material.dart';
import 'Widgets/login_signup_btn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen( {Key key}) : super(key: key);
  //padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Container(
    child: Column(children: [
    SizedBox(height: MediaQuery.of(context).size.height/10),
     SingleChildScrollView(
      child: SafeArea(
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/logo.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width/2,
          height: MediaQuery.of(context).size.height/2.5,
          ),
          SizedBox(height: MediaQuery.of(context).size.height/15),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    )
        ),
      ),
      ],)  
    ),
    );
  }
}
