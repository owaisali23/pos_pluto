import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/createInventory.dart';
import 'package:flutter_auth/Services/imagecontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/productcartModel.dart';

class ItemCard extends StatelessWidget {

  var name;
  var category;
  String imageUrl;
  String id;

  final CountController = TextEditingController();
  final WarrantyController = TextEditingController();
  final PriceController = TextEditingController();
   final CreateInventoryController controller = Get.put(CreateInventoryController());
   final ImageController Icontroller = Get.put(ImageController());
   String completeUrl;

  ItemCard(this.name, this.category, this.imageUrl, this.id,);
  @override
  Widget build(BuildContext context) {
    RxBool isLoading = false.obs;
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10, right: 2,left: 2),
      child: Container(
        padding: EdgeInsets.only(bottom: 10,),
        decoration: BoxDecoration(
           color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(10) ),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 3),
                blurRadius: 8,
                color: Color.fromARGB(255, 158, 154, 154).withOpacity(0.15),
              )
            ],
          ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
               padding: EdgeInsets.all(10),  
              child: SizedBox(
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                AspectRatio(
                        aspectRatio: 0.88,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                               // color: Colors.grey, // Placeholder color for the image
                              ),
                            ),
                             FutureBuilder<String>(
                              future: Icontroller.imageApi(imageUrl),
                          builder: (context, snapshot) {
                            String completeUrl = snapshot.data;
                           if (completeUrl == null) {
                          // Show a placeholder or loading widget until the image URL is fetched
                            return Center(
                             child: CircularProgressIndicator(),
                            );
                         } else {
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
                          ],
                        ),
                      ),
           ],),
          ), ),
         ),
        Row( 
              children: [
  
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                               // Padding(
                    //  padding: const EdgeInsets.symmetric(horizontal: 14),
                      Text( 
                        name,
                        overflow: TextOverflow.ellipsis, 
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12.5),
                      ),
                       SizedBox(height: 2,),        // ),
                     Text(
                        category,
                        style: TextStyle( color: Colors.black, fontSize: 11 ),
                      ),
                      // Text(
                      //   "Rs:" + price.toString() + "/-",
                      //   style: TextStyle( fontWeight: FontWeight.bold,color: Colors.black, fontSize: 11 ),
                      // ),
                    ],),
                  ),
                ),
             ],),
             Divider(),
             InkWell(  
                onTap: () { 
         showDialog(
                  context: context,
                  builder: (context) {
                    return          
          AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: Text("Enter the Details"),
          content: 
                 Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Container( 
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/60),
              alignment: Alignment.topLeft,
              child: Text( 
                'Sign Up To POS Pluto',
                style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w400,fontSize: 14),
                ),),
          SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
           // keyboardType: TextInputType.emailAddress,
           // textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: CountController,
            decoration: const InputDecoration(
              hintText: "Count",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.store),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
              controller: WarrantyController,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Warranty",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.shop),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50),
          TextFormField(
              controller: PriceController,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Price",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
             ],
         ),
         actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, [0, 0, 0]),
              child: Text("CANCEL"),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
            //  onPressed: ()// => controller.AddinventApi(),

              onPressed: () async{
            //  int Count = int.tryParse(CountController.text) ?? 0;
            //  int Warranty = int.tryParse(WarrantyController.text) ?? 0;
            //  int Price = int.tryParse(PriceController.text) ?? 0;    
            final String tokenKey = 'auth_token';
            final prefs = await SharedPreferences.getInstance();
            final token = prefs.getString(tokenKey) ?? '';

      
  isLoading.value = true;
  final response = await http.post(Uri.parse('https://pos-pluto-server.vercel.app/api/v1/inventory'),
  headers: {
            'Authorization': token,
          },
body: {
           "productId": "64b96ee202c5a42f4a1fdc38",
            "count": 14,
            "price": 1000,
            "warranty": 1 
},   
  );

   print (response.statusCode);
   if (response.statusCode == 200) {

      isLoading.value = false;
      print (response.statusCode);
      print("Product Added to inventory");
      Get.snackbar("Product Added To Inventory", 'Success');
    // Get.to(() => EmployeesList());
}
  else {
   // print("Product Adding Failed");
    //print ();
    print (response.statusCode);
   // print(response);
    isLoading.value = false;
    Get.snackbar("Error","Please try again");
 }
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
              },
                 child: Container(          
                 height: 20,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: kPrimaryColor,),
                      SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          'Add To Inventory ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),
                        ),
                      ),
                    ],
                  ),
                             ),
               ),

          ],
        
        ),
      ),
    ); 
         
  }
}
