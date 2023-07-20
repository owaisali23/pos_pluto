import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_auth/Services/employeelistcontroller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:signal_ui/constants.dart';

class Chat extends StatelessWidget {
  var name;
  var email;
  String id;
  
  Chat(this.name, this.email, this.id);
  final EmployeeListController econtroller = Get.put(EmployeeListController());

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(12),
      //set border radius more than 50% of height and width to make circle
  ),
  /*    endActionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          foregroundColor: Colors.white,
          color: archiveBg,
          icon: Icons.archive,
        )
      ],*/
      child: ListTile(
       // onTap: onTap,
        leading: CircleAvatar(
          backgroundColor:
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
          radius: 25,
          child: Text(
            name[0],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      subtitle: Text(email),
      trailing:  GestureDetector(
        onTap: () async{

  final EmployeeListController econtroller = Get.put(EmployeeListController());

  final String tokenKey = 'auth_token';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(tokenKey) ?? '';
  
 // RxString ID = scontroller.empid ;

  econtroller.isLoading(true);
  final response = await http.delete(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/users/employees/$id/'),
  headers: {
            'Authorization': token,
          },
  );

  print (response.statusCode);
  //print(ID);
  

   if (response.statusCode == 200) {

      econtroller.isLoading(false);
      print("Empolyee Deleted Successfull");
      Get.snackbar("Empolyee Deleted Successfull", 'Done');
    // Get.to(() => EmployeesList());
}
  else {
    print("Employee Deleting Failed");
    print(id);
    econtroller.isLoading(false);
    Get.snackbar("Error","Please try again");
 }
},
           child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.delete_forever,
                size: 24,
                color: Colors.red ,
              ),
            ),
        ),
      ),
    );
  }
 
 }

/*class DeleteController extends GetxController{
 RxString empid = ''.obs;
 void getid(){

  final id = empid;
 }

}*/