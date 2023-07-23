import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/productcartModel.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/body.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/cardcart.dart';
import 'package:flutter_auth/Screens/Orders/Widgets/check_out_card.dart';
import 'package:flutter_auth/Services/inventorycontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';
//import 'package:flutter_auth/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../navdrawer.dart';
//import 'package:shop_app/models/Cart.dart';


class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
   TextEditingController _searchController = TextEditingController();
   final List<Product> selectedProducts;
   _OrderScreenState ({ this.selectedProducts});

   
  bool _isSearching = false;
  String _searchText = "";
   bool  check1 = false;
  final InventoryController icontroller = Get.put(InventoryController());
  final RefreshController _refreshController = RefreshController();
 

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF4F4F4),
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,    
      backgroundColor: kPrimaryColor,
        title:
       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Products",
                    style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(255, 255, 255, 255)),fontWeight:FontWeight.w600,fontSize: 18)
                  ),
                  // if(selectedProducts.length != null)
                  // Text(
                  //   selectedProducts.length.toString() ?? "" + "Items" ,
                  //   style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(255, 255, 255, 255)),fontWeight:FontWeight.w600,fontSize: 18)
                  // ),
                ],
              )
            ],
          ),
        elevation: 0.0,
       bottom: PreferredSize(
          preferredSize: Size.fromHeight(67.0),
          child: Padding(
            padding: EdgeInsets.only(bottom: 15, right: 13,left: 13 ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
              ),
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ),
  ),

    body:    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 21,
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 1000,
                  //  bottom: MediaQuery.of(context).size.width / 60,
                  ),
                 
                ),
                Obx(() {
                  if (icontroller.isLoading.value == true) {
                    return Expanded(child: Center(child: CircularProgressIndicator()));
                  } else {
                    final filteredProduct = icontroller.inventory.where(
                      (inventory) => inventory.product.name
                          .toLowerCase()
                          .contains(_searchText.toLowerCase()),
                    ).toList();
                    return Expanded(
                      child: SmartRefresher(
                        enablePullDown: true,
                        controller: _refreshController,
                        onRefresh: () async {
                          await icontroller.reloadinventoryProduct();
                          _refreshController.refreshCompleted();
                        },
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          shrinkWrap: true,
                          itemCount: filteredProduct.length,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CartCard(
                              filteredProduct[index].product.name,
                              filteredProduct[index].product.details.type,
                              filteredProduct[index].price,
                              filteredProduct[index].id,
                              filteredProduct[index].productId,
                              filteredProduct[index].warranty,
                              filteredProduct[index].product.imageUrl
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
      ),
      bottomNavigationBar:
          CheckoutCard()  
          
      );

  }
}    
      //Body(),

