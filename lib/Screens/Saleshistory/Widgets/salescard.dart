import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Services/imagecontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SalesCard extends StatelessWidget {
  String name;
  int price;
  String customerName;
  String customerPhone;
  int count;
  String id;
  String imageUrl;

  SalesCard(this.name, this.price, this.customerName, this.customerPhone, this.count, this.id, this.imageUrl);
  final ImageController controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
     RxBool isLoading = false.obs;
    return  Container(
      margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                   Container(
                                  width: 60,
                                  height: 60,
                                child: FutureBuilder<String>(
                              future: controller.imageApi(imageUrl),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(), // Show circular progress indicator while waiting for data
                                  );
                                } else if (snapshot.hasError) {
                                  // Handle error if needed
                                  return Text('Error fetching image URL');
                                } else {
                                  String completeUrl = snapshot.data;
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(completeUrl),
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  );
                                }
                              },
                            ),
                                ),
                    SizedBox(width: 16),
                     
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              // You can add more information here if needed.
                            ],
                          ),

                 SizedBox( height: MediaQuery.of(context).size.height/140),
              Text(
                customerName,
                //cart.product.title,
                style: TextStyle(color: Colors.black54, fontSize: 14),
                maxLines: 2,
              ),
              Text(
                customerPhone,
                //cart.product.title,
                style: TextStyle(color: Colors.black54, fontSize: 12),
                maxLines: 2,
              ),
                      ],
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            count.toString(),
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Rs " + price.toString(),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(), // Add a divider for visual separation.
          InkWell(
            onTap: () async{
            int selectedCount = await _showReturnDialog(context);
            final String tokenKey = 'auth_token';
            final prefs = await SharedPreferences.getInstance();
            final token = prefs.getString(tokenKey) ?? '';
      final bodyData = json.encode({
      "id": id,
      "count": selectedCount
    });
  isLoading.value = true;
  final response = await http.post(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/inventory/return'),
  headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
  body: bodyData       
  );

  print (response.statusCode);

   if (response.statusCode == 200) {

      isLoading.value = false;
      print("Product Returned Successfull");
      Get.snackbar("Product Returned Successfull", 'Done');
    // Get.to(() => EmployeesList());
}
  else {
    print("Product Returned Failed");
    print(id);
    isLoading.value = false;
    Get.snackbar("Error","Please try again");
 }
},
         child: Obx(() {
         if (isLoading.value) {
           return Center(child: CircularProgressIndicator());
          } else {
         return
            Container(          
                padding: const EdgeInsets.all(5.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_return, color: kPrimaryColor,),
                    SizedBox(width: 8),
                    Text(
                      'Return',
                      style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),
                    ),
                  ],
                ),
              );
              }
            }),
            ),
          ],
        ),
      ),
    );
      
  }
}


Future<int> _showReturnDialog(BuildContext context) async {
  final TextEditingController countController = TextEditingController();

  int selectedCount = await showDialog<int>(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: Text("Enter the Count that you want to return"),
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: countController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 0),
            child: Text("CANCEL"),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            ),
            onPressed: () {
              // Parse the input value from the TextField as an integer
              int enteredCount = int.tryParse(countController.text) ?? 0;

              // Close the dialog and return the entered count value
              Navigator.pop(context, enteredCount);
            },
            child: Text(
              "DONE",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );

  return selectedCount;
}



  // Future<int> _showReturnDialog(BuildContext context) async {
  //   final TextEditingController countController = TextEditingController();

  //   int selectedCount = await showDialog<int>(
  //     context: context,
  //     builder: (context) {
  //       return Center(
  //         child: Container(
  //           width: MediaQuery.of(context).size.width * 0.8, // 80% of the screen width
  //         height: MediaQuery.of(context).size.height * 0.4,
  //           child: AlertDialog(
  //             insetPadding: EdgeInsets.zero,
  //                      contentPadding: EdgeInsets.all(10),
  //                       shape: RoundedRectangleBorder(
  //                        borderRadius:
  //                        BorderRadius.all(
  //                        Radius.circular(10.0))),
  //             title: Text("Enter the Count that you want to return"),
  //             content: TextField(
  //               controller: countController,
  //               keyboardType: TextInputType.number,
  //               inputFormatters: <TextInputFormatter>[
  //                 FilteringTextInputFormatter.digitsOnly,
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context, 0),
  //                 child: Text("CANCEL"),
  //               ),
  //               TextButton(
  //                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
  //                 onPressed: () {
  //                   // Parse the input value from the TextField as an integer
  //                   int enteredCount = int.tryParse(countController.text) ?? 0;
                  
  //                   // Close the dialog and return the entered count value
  //                   Navigator.pop(context, enteredCount);
  //                 },
  //                 child: Text("DONE", style: TextStyle(color: Colors.white),),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   return selectedCount;
  // }
