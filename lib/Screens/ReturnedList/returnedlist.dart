import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/returnedlistModel.dart';
import 'package:flutter_auth/Services/returnedcontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../navdrawer.dart';

class ReturnedProductScreen extends StatefulWidget {
  @override
  _ReturnedProductScreenState createState() => _ReturnedProductScreenState();
}

class _ReturnedProductScreenState extends State<ReturnedProductScreen> {
  final ReturnedProductController rcontroller = Get.put(ReturnedProductController());
  final RefreshController _refreshController = RefreshController();
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    rcontroller.fetchReturnedProducts(); // Fetch the returned products from the controller
  }

  void _filterProducts(String searchTerm) {
    rcontroller.filterProducts(searchTerm);
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _isSearching = false;
      rcontroller.resetFilter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    _filterProducts(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Products',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: _clearSearch,
                  ),
                ),
              )
            : Text(
                'Returned Products',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.white),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _clearSearch();
                }
              });
            },
          ),
        ],
      ),
      body: Container(
        
            child: Obx(
              () {
                if (rcontroller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return SmartRefresher(
                          enablePullDown: true,
                          controller: _refreshController, // Use the separate RefreshController
                          onRefresh: () async {
                            await rcontroller.reloadReturnedProducts();
                            _refreshController.refreshCompleted();
                          },
                    child: ListView.builder(
                      itemCount: rcontroller.filteredProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        var product = rcontroller.filteredProducts[index];
                        return Container(
                          height: 100,
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
                          )  ,
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage( rcontroller.filteredProducts[index].productDetails.imageUrl), // Replace with actual product image
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                 product.productDetails.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 4),
                                    Text(
                                      'Price: \$${product.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Count: ${product.count}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Customer Name: ${product.customerName}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               
                            ],
                          ),
                        );
                      },
                    ),
            );
                }
              },
            ),
      ),
    );
  }
}
