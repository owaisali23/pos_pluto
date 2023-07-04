import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Saleshistory/Widgets/salescard.dart';
import 'package:flutter_auth/Services/inventorycontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesHistory extends StatefulWidget {
  @override
  SalesHistoryState createState() => SalesHistoryState();
}
 /* class HistoryModel {
  final String historyAssetPath;
  final String historyType;
  final String receiverName;
  final double amount;
  final String date;
  final String cardLogoPath;

  HistoryModel(this.historyAssetPath, this.historyType, this.receiverName,
      this.amount, this.date, this.cardLogoPath);
}*/

class SalesHistoryState extends State<SalesHistory> {
 /* List<HistoryModel> histories = [
    HistoryModel('assets/images/Shoes.jpg', 'Paid to', 'Salina', 999.0,
        '08 May 2018', 'assets/images/Shoes.jpg'),
    HistoryModel('assets/images/Shoes.jpg', 'Electricity\nbill paid',
        'Fantasy lights', 830.0, '08 May 2018', 'assets/images/Shoes.jpg'),
    HistoryModel('assets/images/Shoes.jpg', 'Mobile\nrecharged',
        'Fantasy mobile', 830.0, '08 May 2018', 'assets/images/Shoes.jpg'),
    HistoryModel('assets/images/Shoes.jpg', 'Received from', 'Salina',
        30.0, '08 May 2018','assets/images/Shoes.jpg'),
  ]; */
    final InventoryController icontroller = Get.put(InventoryController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      drawer: NavDrawer(),
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            //   child: Text(
            //     'Sales:',
            //     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
              child: Container(
//              height: 42.0,
                child: Row(
                  children: <Widget>[
                    Text(
                       'Sales:',
                       style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
                    ),
                    SizedBox(width:40),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Month',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Categories',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
             Obx(() {
                    if(icontroller.isLoading.value == true){
                    return Center(child: CircularProgressIndicator());}
                    else{
                   return 
            Expanded(
              child: ListView.builder(
                  itemCount: icontroller.inventory.length,// histories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SalesCard(icontroller.inventory[index].product.name, icontroller.inventory[index].price);
                  }),
            );
              }
              },),
          ],
        ),
      ),
    );
  }
}





AppBar buildAppBar() {
    return AppBar(
      title: 
       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sales History",
                    style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(255, 255, 255, 255)),fontWeight:FontWeight.w600,fontSize: 18)
                  ),
                ],
              )
            ],
          ),
      centerTitle: true,    
      backgroundColor: kPrimaryColor,
     /* elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.search,
            size: 24,
            color: Colors.white ,
          ),
        ),
     //   SizedBox(width: 20 / 2)
      ],*/
    );
}