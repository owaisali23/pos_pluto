import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Saleshistory/Widgets/salescard.dart';
import 'package:flutter_auth/Services/soldcontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SalesHistory extends StatefulWidget {
  @override
  SalesHistoryState createState() => SalesHistoryState();
}
class SalesHistoryState extends State<SalesHistory> {

  final SoldController scontroller = Get.put(SoldController());
 final RefreshController _refreshController = RefreshController();
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

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
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      drawer: NavDrawer(),
      appBar: AppBar(
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
      //  actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(15.0),
      //       child: GestureDetector(
      //         onTap: () {
      //           scontroller.reloadSoldProduct();
      //         },
      //         child: Icon(
      //           Icons.refresh_sharp,
      //           size: 24,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ],
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
    body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              child: Obx(() {
                if (scontroller.isLoading.value == true) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final filteredProduct = scontroller.sproducts
                      .where((sproducts) =>
                          sproducts.product.name
                              .toLowerCase()
                              .contains(_searchText.toLowerCase()))
                      .toList();
                  return SmartRefresher(
                    enablePullDown: true,
                    controller: _refreshController, // Use the separate RefreshController
                    onRefresh: () async {
                      await scontroller.reloadSoldProduct();
                      _refreshController.refreshCompleted();
                    },
                    child: ListView.builder(
                      itemCount: filteredProduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SalesCard(
                          filteredProduct[index].product.name,
                          filteredProduct[index].price,
                          filteredProduct[index].customerName,
                          filteredProduct[index].customerPhone,
                          filteredProduct[index].count,
                          filteredProduct[index].id,
                          filteredProduct[index].product.imageUrl
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ),
        ],
      ),

    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
