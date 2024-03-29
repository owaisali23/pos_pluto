import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/categories.dart';
import 'package:flutter_auth/Services/inventorycontroller.dart';
import 'package:flutter_auth/Screens/Inventory/Widgets/itemscard.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/Models/productsModel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class Body extends StatelessWidget {

 final InventoryController icontroller = Get.put(InventoryController());
 final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
             "Categories",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black ),
            ),
            
          ),
          SizedBox(height: 10),
       //  FutureBuilder<productsModels>(
      //  future: getproduct(),
      //  builder: (context, snapshot){
       // if(snapshot.hasData){
        //  return //Text(snapshot.data.result[1].name.toString());
        //  Categories(),
          Expanded(
            child:
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: 
              Obx(() {
                    if(icontroller.isLoading.value == true){
                    return Center(child: CircularProgressIndicator());}
                    else{
                   return SmartRefresher(
                          enablePullDown: true,
                          controller: _refreshController, // Use the separate RefreshController
                          onRefresh: () async {
                            await icontroller.reloadinventoryProduct();
                            _refreshController.refreshCompleted();
                          },
                    child: GridView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
                  itemCount: icontroller.inventory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) =>ItemCard( 
                    icontroller.inventory[index].product.name,
                    icontroller.inventory[index].product.categoryName,
                     icontroller.inventory[index].product.imageUrl,
                     icontroller.inventory[index].id,
                     icontroller.inventory[index].count,
                     icontroller.inventory[index].price

                   ), 
                  ),
              );
                  }
              },),
                  
              ),  
            ), 
        ], 
      );
  }
}
