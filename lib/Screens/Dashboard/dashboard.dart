import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Employees/employeeslist.dart';
import 'package:flutter_auth/Screens/Saleshistory/saleshistory.dart';
import 'package:flutter_auth/Services/employeelistcontroller.dart';
import 'package:flutter_auth/Services/logincontroller.dart';
import 'package:flutter_auth/Services/soldcontroller.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesSummaryScreen extends StatelessWidget {
  final SoldController scontroller = Get.put(SoldController());
  final EmployeeListController employeeListController =
      Get.put(EmployeeListController());

  AppBar buildAppBar() {
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dashboard",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    String userName = Get.put(LoginController()).getName;

    return Scaffold(
      appBar: buildAppBar(),
      drawer: NavDrawer(),
      body: Column(
        children: [
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome, $userName',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTotalPriceCard(context),
                SizedBox(height: 20),
                _buildTotalProductsSoldCard(context),
                SizedBox(height: 20),
                _buildTotalEmployeesCard(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPriceCard(BuildContext context) {
    return InkWell(
      onTap: () => {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SalesHistory();
                },
              ),
             ),
            },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color:Colors.blueAccent, width: 2),
        ),
        child: Stack(
          children: [
            // Background image with overlay
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/Total.jpg"), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Overlay to darken the background image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: kPrimaryLightColor.withOpacity(0.7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.monetization_on,
                    size: 50,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Price of Products Sold',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    if (scontroller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      // Calculate total price of products sold
                      double totalPrice = 0;
                      for (var product in scontroller.sproducts) {
                        totalPrice += product.price;
                      }
    
                      return Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    );
  }

  Widget _buildTotalProductsSoldCard(BuildContext context) {
    return InkWell(
      onTap: () => {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SalesHistory();
                },
              ),
             ),
            },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.green, width: 2),
        ),
        child: Stack(
          children: [
            // Background image with overlay
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/Products.jpg"), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Overlay to darken the background image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: kPrimaryLightColor.withOpacity(0.7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 50,
                    color: Colors.green,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Number of Products Sold',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    if (scontroller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      // Calculate total number of products sold
                      int totalProductsSold = scontroller.sproducts.length;
    
                      return Text(
                        totalProductsSold.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    );
  }

  Widget _buildTotalEmployeesCard(BuildContext context) {
    return InkWell(
      onTap: () => {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EmployeesList();
                },
              ),
             ),
            },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.orange, width: 2),
        ),
        child: Stack(
          children: [
            // Background image with overlay
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/Employees.jpg"), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Overlay to darken the background image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: kPrimaryLightColor.withOpacity(0.7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.people,
                    size: 50,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Number of Employees',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    if (employeeListController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      // Calculate total number of employees
                      int totalEmployees = employeeListController.employees.length;
    
                      return Text(
                        totalEmployees.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    );
  }


}


