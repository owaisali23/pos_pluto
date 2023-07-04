import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LoginEmployer/login_screen2.dart';
import 'package:flutter_auth/Screens/LoginEmploye/login_screen1.dart';

import '../../../constants.dart';


class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginEmployerScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryColor, elevation: 0),
          child: Text(
            "login as employer".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/50),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginEmployeeScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryColor, elevation: 0),
          child: Text(
            "login as employee".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
