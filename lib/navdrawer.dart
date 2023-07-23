import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/AddEmploye/addemp.dart';
import 'package:flutter_auth/Screens/AddProduct/addinvent.dart';
import 'package:flutter_auth/Screens/Dashboard/dashboard.dart';
import 'package:flutter_auth/Screens/Employees/employeeslist.dart';
import 'package:flutter_auth/Screens/Inventory/inventoryscreen.dart';
import 'package:flutter_auth/Screens/Orders/orders.dart';
import 'package:flutter_auth/Screens/ProductsList/productList.dart';
import 'package:flutter_auth/Screens/ReturnedList/returnedlist.dart';
import 'package:flutter_auth/Screens/Saleshistory/saleshistory.dart';
import 'package:flutter_auth/Screens/Settings/settings.dart';
import 'package:flutter_auth/Screens/UpdateInventory/updateinventory.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
//import 'package:flutter_auth/constants.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return 
     Drawer( 
      child: Padding(
        padding: EdgeInsets.only(top: 50),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
             /*
             leading: IconButton(
             icon: const Icon(Icons.arrow_back, color: Colors.white),
             onPressed: () => Navigator.of(context).pop(),
             ),
              DrawerHeader(
                child: Text(
                  'Side menu',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
               decoration: BoxDecoration(
                    color: kPrimaryColor,
                   /* image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/cover.jpg'))*/),
              ),*/
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dashboard'),
                onTap: () => {  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SalesSummaryScreen();
                },
              ),
             ),},
              ),
                    ListTile(
                leading: Icon(Icons.shop_2),
                title: Text('Order'),
                onTap: () => {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OrderScreen();
                },
              ),
             ),
            },
              ),
              ListTile(
                leading: Icon(Icons.inventory),
                title: Text('Inventory'),
                onTap: () => {  Navigator.push(
               context,
               MaterialPageRoute(
                builder: (context) {
                  return Inventory();},
               ),
              ),
             }
            ),
             ListTile(
                leading: Icon(Icons.shop_2),
                title: Text('Products List / Add Products to Inventory'),
                onTap: () => {  Navigator.push(
               context,
               MaterialPageRoute(
                builder: (context) {
                  return Productslist();},
               ),
              ),
             }
            ),
              ListTile(
                leading: Icon(Icons.add_box),
                title: Text('Add Product'),
                onTap: () => {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddProduct();
                },
              ),
             ),
            },
              ),

            //  ListTile(
            //     leading: Icon(Icons.update),
            //     title: Text('Create Inventory'),
            //     onTap: () => {
            //     showDialog(
            //      context: context,
            //      builder: (context) {
            //       return AlertDialog(
            //         insetPadding: EdgeInsets.zero,
            //        contentPadding: EdgeInsets.all(10),
            //         shape: RoundedRectangleBorder(
            //          borderRadius:
            //          BorderRadius.all(
            //          Radius.circular(10.0))),
            //       //  insetPadding: EdgeInsets.all(60),
            //         scrollable: true,
            //         title: Text('Create Inventory:'),
            //         content: Column(
            //           children: [
            //             Container(
            //               height: 200,
            //               width: 350,
            //               padding: const EdgeInsets.only(top:10, right: 10, left: 10),
            //               margin: EdgeInsets.only(top: 20),
            //               child: Form(
            //                 child: Column(
            //                   children: <Widget>[
            //                     TextFormField(
            //                      decoration: InputDecoration(
            //                      hintText: "Product Category",
            //                     icon: Icon(Icons.category),
            //                       ),
            //                     ),
            //                     SizedBox(height: 20),
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                         labelText: 'Product Name',
            //                         icon: Icon(Icons.shop_rounded),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),  
            //           Padding(
            //             padding: const EdgeInsets.all(15.0),
            //             child: Center(
            //               child: SizedBox(
            //                height: 50,
            //                width: 200,
            //                 child: ElevatedButton(
            //                     child: Text("Done"),
            //                     onPressed: () {
            //                     Navigator.push(
            //                      context,
            //                      MaterialPageRoute(
            //                       builder: (context) {
            //                       return UpdateInventory();
            //                       },),
            //                      );}
            //                     ),
            //                    ),),
            //                   ),
            //          ],
            //         ),
            //       );
            //     }),
            //  },
            //   ), 
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Sales History/Return Product'),
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
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Employees List'),
                onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EmployeesList();
                },
               ),
              ),
             },
              ),
              ListTile(
                leading: Icon(Icons.person_add_alt_sharp),
                title: Text('Add Employee'),
                onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddEmp();
                },
               ),
              ),
             },
              ),
              // ListTile(
              //   leading: Icon(Icons.assignment_return),
              //   title: Text('Return Product'),
              //   onTap: () => {
              //   showDialog(
              //   context: context,
              //   builder: (context) {
              //     return AlertDialog(
              //       insetPadding: EdgeInsets.zero,
              //      contentPadding: EdgeInsets.all(10),
              //       shape: RoundedRectangleBorder(
              //        borderRadius:
              //        BorderRadius.all(
              //        Radius.circular(10.0))),
              //     //  insetPadding: EdgeInsets.all(60),
              //       scrollable: true,
              //       title: Text('Product Returns:'),
              //       content: Column(
              //         children: [
              //           Container(
              //             height: 200,
              //             width: 350,
              //             padding: const EdgeInsets.only(top:10, right: 10, left: 10),
              //             margin: EdgeInsets.only(top: 20),
              //             child: Form(
              //               child: Column(
              //                 children: <Widget>[
              //                   TextFormField(
              //                    decoration: InputDecoration(
              //                    hintText: "Customer Name",
              //                   icon: Icon(Icons.account_box),
              //                     ),
              //                   ),
              //                   SizedBox(height: 20),
              //                   TextFormField(
              //                     decoration: InputDecoration(
              //                       labelText: 'Receipt Number',
              //                       icon: Icon(Icons.receipt),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),  
              //         Padding(
              //           padding: const EdgeInsets.all(15.0),
              //           child: Center(
              //             child: SizedBox(
              //              height: 50,
              //              width: 200,
              //               child: ElevatedButton(
              //                   child: Text("Submit"),
              //                   onPressed: () {
              //                   Navigator.push(
              //                    context,
              //                    MaterialPageRoute(
              //                     builder: (context) {
              //                     return Returns();
              //                     },),
              //                    );}
              //                   ),
              //                  ),),
              //                 ),

            //          ],
            //         ),
            //       );
            //     }),
                  
            //  },
            // ),
            ListTile(
                leading: Icon(Icons.arrow_back_sharp),
                title: Text('Returned Products List'),
                onTap: () => {Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) {
                  return ReturnedProductScreen();
                },
               ),
              ),},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => {Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) {
                  return SettingsScreen();
                },
               ),
              ),},
              ),
              SizedBox(height: 250),
              ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                   onTap: () => {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WelcomeScreen();
                },
              ),
             ),
            },
                  ),
            ],
          ),
        ),
    );
  }
}