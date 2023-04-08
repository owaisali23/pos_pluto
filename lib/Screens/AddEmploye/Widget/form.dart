import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_auth/Screens/AddEmploye/Widget/dropdown.dart';
import 'package:flutter_auth/constants.dart';


class Addform extends StatelessWidget {
  const Addform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
             // onSaved: () {},
              decoration: const InputDecoration(
                hintText: "Username (with copany preset)",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person_add_alt_sharp),
                ),
              ),
            ),
            SizedBox(height: 20),
             TextFormField(
               // textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Name",
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
           TextFormField(
             // keyboardType: TextInputType.emailAddress,
             // textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
             // onSaved: () {},
              decoration: const InputDecoration(
                hintText: "Position",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.supervisor_account_outlined),
                ),
              ),
            ),
            SizedBox(height: 30),
             Dropdown(),

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
              onPressed: () {},
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
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
   