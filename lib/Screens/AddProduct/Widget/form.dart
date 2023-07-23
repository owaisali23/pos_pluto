import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/addprodcontroller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_auth/Screens/AddProduct/Widget/productimage.dart';

import 'package:flutter_auth/Screens/AddProduct/Widget/dropdown.dart';
import 'package:flutter_auth/constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class Addform extends StatelessWidget {
   Addform({Key key}) : super(key: key);
  final AddProductController pcontroller = Get.put(AddProductController());
  final RefreshController _refreshController = RefreshController();
  void onImageSelected(String base64String) {
    // Do something with the base64String received from AddImageCard
    // For example, you can save it to the product model in your AddProductController.
    pcontroller.setProductImage(base64String);
  }

  @override
  Widget build(BuildContext context) {
    pcontroller.isLoading.listen((isLoading) {
      if (!isLoading) {
        // Reset the text controllers to empty strings when isLoading is false
        pcontroller.pordNameController.value.clear();
        pcontroller.prodCategoryController.value.clear();
        pcontroller.prodBrandController.value.clear();
        pcontroller.prodTypeController.value.clear();
        pcontroller.prodModalController.value.clear();
        pcontroller.prodYearController.value.clear();

      }
    });
    return Obx(() {
    if(pcontroller.isLoading.value == true){
      return Center(child: CircularProgressIndicator());}
    else{
     return   
    Container(
        child: Padding(
         padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(    
          child: Column(
            children: [
              const SizedBox(height: 20),          
              TextFormField(
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Product Name",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.shop),
                  ),
                ),
              ),
              SizedBox(height: 20),
               TextFormField(
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "Category",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.category),
                    ),
                  ),
                ),
             SizedBox(height: 20),
              TextFormField(
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Brand",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.branding_watermark),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Model",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.model_training),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
               keyboardType: TextInputType.multiline,
               cursorColor: kPrimaryColor,
               decoration: const InputDecoration(
               hintText: "Details",
               prefixIcon: Padding(
               padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 35),
               child: Icon(Icons.date_range),
    ),
  ),
),

    
              SizedBox(height: 20),
    
            //  Dropdown(),
    
            //  SizedBox(height: 30),
    
              AddImageCard(onImageSelected: onImageSelected),
    
            
                const SizedBox(height: 50),
                  SizedBox(
                    width: /*getProportionateScreenWidth*/250,
                    height: 60,
                    child: TextButton(
                     style: TextButton.styleFrom(
                     shape:
                     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                     primary: Colors.white,
                     backgroundColor: kPrimaryColor,
                     ),
                onPressed: () => pcontroller.AddprodApi() ,
                child: Text(
                 "Add to Products",
                 style: TextStyle(
                 fontSize: /*getProportionateScreenWidth*/(20),
                color: Colors.white,
                ),
               ),
             ),
           ),
             const SizedBox(height: 40),
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
