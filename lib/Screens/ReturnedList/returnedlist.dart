import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../navdrawer.dart';

class ReturnedProductScreen extends StatefulWidget {
  @override
  _ReturnedProductScreenState createState() => _ReturnedProductScreenState();
}

class _ReturnedProductScreenState extends State<ReturnedProductScreen> {
  List<String> returnedProducts = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
  ]; // Replace with actual returned products list

  List<String> filteredProducts = [];

  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredProducts = returnedProducts;
  }

  void _filterProducts(String searchTerm) {
    filteredProducts = returnedProducts
        .where((product) =>
            product.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      filteredProducts = returnedProducts;
      _isSearching = false;
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
            : Text('Returned Products',
            style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.white),fontWeight:FontWeight.w600,fontSize: 18)),
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
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Shoes.jpg'), // Replace with actual product image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                filteredProducts[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    'Reason for Return',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Refund Amount: -\$50.00',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
