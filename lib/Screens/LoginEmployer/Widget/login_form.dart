import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/logincontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class LoginForm extends StatelessWidget {
  
  LoginController controller = Get.put(LoginController());
   LoginForm(LoginController);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    if(controller.isLoading.value == true){
      return Center(child: CircularProgressIndicator());}
     else{
      return Form(
      child: Column(
        children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container( 
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/60),
              alignment: Alignment.topLeft,
              child: Text( 
                'Login as Employee',
                style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w400,fontSize: 14),
                ),),
           ],
         ),
          SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
           // keyboardType: TextInputType.emailAddress,
           // textInputAction: TextInputAction.next,
           controller: controller.emailController.value,
            cursorColor: kPrimaryColor,
           // onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Username , Email & Phone Number",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
              controller: controller.passwordController.value,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          SizedBox(height: MediaQuery.of(context).size.height/60),
          Container( 
          alignment: Alignment.bottomRight,
          child: Text( 
            'Forgot Password?',
            style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 15),
            ),),
          SizedBox(height: MediaQuery.of(context).size.height/15),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                controller.LoginApi();
            },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
        ],
      ),
    );
    }
   },
  );
  }
}
