import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/signupcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';


class SignupForm extends StatelessWidget {

 SignupController controller = Get.put(SignupController());

   SignupForm(SignupController);

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
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
                'Sign Up To POS Pluto',
                style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w400,fontSize: 14),
                ),),
           ],
         ),
          SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
           // keyboardType: TextInputType.emailAddress,
           // textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: controller.storenameController.value,
            decoration: const InputDecoration(
              hintText: "Store Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
              controller: controller.descriptionController.value,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Store Description",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
              controller: controller.nameController.value,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
              SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
              controller: controller.emailController.value,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
              controller: controller.passwordController.value,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          SizedBox(height: MediaQuery.of(context).size.height/60),
          SizedBox(height: MediaQuery.of(context).size.height/15),
          Hero(
            tag: "SignUp_btn",
            child: ElevatedButton(
              onPressed: () {
                controller.SignUpApi();
                 /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Dashboard();
                },
              ),
             );*/
            },
              child: Text(
                "SignUp".toUpperCase(),
              ),
            ),
          ),
        //   if(controller.isLoading == true)
        //    Center(child: CircularProgressIndicator(),)
        ],),   
       );
    }
   },
  );
  }
}
