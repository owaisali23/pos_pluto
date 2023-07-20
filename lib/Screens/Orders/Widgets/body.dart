// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/Inventory/inventoryscreen.dart';
// import 'package:flutter_auth/Screens/Orders/Widgets/cardcart.dart';
// import 'package:flutter_auth/Services/inventorycontroller.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// //import '../../../size_config.dart';

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   bool  check1 = false;
//   final InventoryController icontroller = Get.put(InventoryController());
//   final RefreshController _refreshController = RefreshController();
 
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: MediaQuery.of(context).size.width / 21,
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.width / 30,
//                     bottom: MediaQuery.of(context).size.width / 40,
//                   ),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Category:',
//                     style: GoogleFonts.lato(
//                       textStyle: TextStyle(color: Colors.black),
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Obx(() {
//                   if (icontroller.isLoading.value == true) {
//                     return Center(child: CircularProgressIndicator());
//                   } else {
//                     final filteredProduct = icontroller.inventory.where(
//                       (inventory) => inventory.product.name
//                           .toLowerCase()
//                           .contains(_searchText.toLowerCase()),
//                     ).toList();
//                     return Expanded(
//                       child: SmartRefresher(
//                         enablePullDown: true,
//                         controller: _refreshController,
//                         onRefresh: () async {
//                           await icontroller.reloadinventoryProduct();
//                           _refreshController.refreshCompleted();
//                         },
//                         child: ListView.builder(
//                           physics: BouncingScrollPhysics(
//                             parent: AlwaysScrollableScrollPhysics(),
//                           ),
//                           shrinkWrap: true,
//                           itemCount: filteredProduct.length,
//                           itemBuilder: (context, index) => Container(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: CartCard(
//                               filteredProduct[index].product.name,
//                               filteredProduct[index].product.details.type,
//                               filteredProduct[index].price,
//                               filteredProduct[index].id,
//                               filteredProduct[index].productId,
//                               filteredProduct[index].warranty,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );

//   }
// }