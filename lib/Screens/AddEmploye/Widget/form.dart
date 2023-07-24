import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/addempcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_auth/Screens/AddEmploye/Widget/dropdown.dart';
import 'package:flutter_auth/constants.dart';


class Addform extends StatelessWidget {
   Addform({Key key}) : super(key: key);
  AddempController empcontroller = Get.put(AddempController());
  void _handleRoleSelection(String value) {
    empcontroller.emproleController.value.text = value;
  }

  @override
  Widget build(BuildContext context) {
    empcontroller.isLoading.listen((isLoading) {
      if (!isLoading) {
        // Reset the text controllers to empty strings when isLoading is false
        empcontroller.empnameController.value.clear();
        empcontroller.empemailController.value.clear();
        empcontroller.emppasswordController.value.clear();
        empcontroller.emproleController.value.clear();
      }
    });
    return Obx(() {
    if(empcontroller.isLoading.value == true){
      return Center(child: CircularProgressIndicator());}
     else{
      return  Container(
      child: Padding(
       padding: const EdgeInsets.only(left: 40, right: 40),
      child: Form(    
        child: Column(
          children: [
            Container(
                       // alignment:Alignment.centerLeft,
                       // padding: EdgeInsets.only(left: 20,),
                        child: Stack(
                          children: [
                            ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            child: Image.asset('assets/images/dp.jpg',
                            fit: BoxFit.cover,
                            width: 85,
                            height: 85,),
                          //  child: InkWell(onTap: onClicked),
                          ),
                        ),
                      ),
                            Positioned(
                              bottom: 0,
                              right: 4,
                              child: buildEditIcon(/*color*/),
                            ),
                          ],
                        ),
                      ),
            const SizedBox(height: 35),          
            TextFormField(
             // keyboardType: TextInputType.emailAddress,
             // textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              controller: empcontroller.empnameController.value,
             // onSaved: () {},
              decoration: const InputDecoration(
                hintText: "Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person_add_alt_sharp),
                ),
              ),
            ),
            SizedBox(height: 20),
             TextFormField(
               // textInputAction: TextInputAction.done,
               controller: empcontroller.empemailController.value,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Employee Email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
           SizedBox(height: 20),
            TextFormField(
             // keyboardType: TextInputType.emailAddress,
             // textInputAction: TextInputAction.next,
             controller: empcontroller.emppasswordController.value,
             obscureText: true,
              cursorColor: kPrimaryColor,
             // onSaved: () {},
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          SizedBox(height: 20),
          //  TextFormField(
          //    // keyboardType: TextInputType.emailAddress,
          //    // textInputAction: TextInputAction.next,
          //     cursorColor: kPrimaryColor,
          //     controller: empcontroller.emproleController.value,
          //    // onSaved: () {},
          //     decoration: const InputDecoration(
          //       hintText: "Employee Role",
          //       prefixIcon: Padding(
          //         padding: EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.supervisor_account_outlined),
          //       ),
          //     ),
          //   ),
            SizedBox(height: 30),
             Dropdown(onSelected: _handleRoleSelection,),

           /* SizedBox(
                height: 40,
                width: 220,  
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 39, 130, 204),),
                  onPressed: () {},
                  child: Text(
                    "Upload Image",  style: TextStyle(fontSize: 16),
                  ),
                ),
              ),*/
              const SizedBox(height: 70),
              SizedBox(
              height: 55,
              width: 300,  
               child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10), // <-- Radius
                ),
              ), 
              onPressed: () {
                empcontroller.AddempApi();
              },
               child: Padding(
                 padding: const EdgeInsets.only(left: 100.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[ 
                     Text(
                     "Add".toUpperCase(),style: TextStyle(fontSize: 22),
                    ),
                    Icon(Icons.arrow_forward_ios),
                    ],
                    ),
               ),
            ),
           ),
          ],
        ),
       ),
      ),
    );
    }
   },
  );
  }
}

 Widget buildEditIcon() => buildCircle(
        color: Colors.white,
        all: 2,
        child: buildCircle(
          color: kPrimaryColor,
          all: 6,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 12,
          ),
        ),
    );

  Widget buildCircle({
    /*required*/ Widget child,
    /*required*/ double all,
    /*required*/ Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
   