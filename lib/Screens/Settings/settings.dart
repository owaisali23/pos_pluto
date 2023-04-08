import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navdrawer.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: NavDrawer(),
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Settings",
                  style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.white),fontWeight:FontWeight.w600,fontSize: 20)
                ),
              ],
            )
          ],
        ), 
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text("Change Logo"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // code to change logo
              },
            ),
            Divider(),
            ListTile(
              title: Text("Change Password"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // code to change password
              },
            ),
            Divider(),
            SwitchListTile(
              value: _darkMode,
              title: Text("Dark Mode"),
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
      
  }
}