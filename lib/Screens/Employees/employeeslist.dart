import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/AddEmploye/addemp.dart';
import 'package:flutter_auth/Services/employeelistcontroller.dart';
import 'package:flutter_auth/navdrawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_auth/Screens/Employees/Widgets/chat.dart';
import 'package:flutter_auth/constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeesList extends StatefulWidget {
  @override
  _EmployeesListState createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  final EmployeeListController econtroller = Get.put(EmployeeListController());
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Employees List",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                econtroller.reloadEmployees();
              },
              child: Icon(
                Icons.refresh_sharp,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
      body: Obx(() {
        if (econtroller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final filteredEmployees = econtroller.employees
              .where((employee) =>
                  employee.name.toLowerCase().contains(_searchText.toLowerCase()))
              .toList();

          return SmartRefresher(
            enablePullDown: true,
            controller: _refreshController,
            onRefresh: () async {
              await econtroller.reloadEmployees();
              _refreshController.refreshCompleted();
            },
            child: SafeArea(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: filteredEmployees.length,
                itemBuilder: (BuildContext context, int index) {
                  return Chat(
                    filteredEmployees[index].name,
                    filteredEmployees[index].email,
                    filteredEmployees[index].id,
                  );
                },
              ),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => AddEmp()),
          );
        },
        child: Icon(
          Icons.edit,
          size: 30,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

















// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/AddEmploye/addemp.dart';
// import 'package:flutter_auth/Services/employeelistcontroller.dart';
// import 'package:flutter_auth/navdrawer.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_auth/Screens/Employees/Widgets/chat.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class EmployeesList extends StatelessWidget {
//    EmployeesList({Key key}) : super(key: key);

//   final EmployeeListController econtroller = Get.put(EmployeeListController());
//   final RefreshController _refreshController = RefreshController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 248, 248, 248),
//       drawer: NavDrawer(),
//       appBar: AppBar(
//        title: 
//        Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: 
//      [
//                   Text(
//                     "Employees List",
//                     style: GoogleFonts.lato(textStyle:TextStyle(color: Color.fromARGB(255, 255, 255, 255)),fontWeight:FontWeight.w600,fontSize: 16)
//                   ),
//                 ],
//               )
//             ],
//           ),
//       centerTitle: true,    
//       backgroundColor: kPrimaryColor,
//       elevation: 0,
//       actions: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: GestureDetector(
//             onTap: () {
//            econtroller.reloadEmployees();
//           },
//             child: Icon(
//               Icons.refresh_sharp,
//               size: 24,
//               color: Colors.white ,
              
//             ),
//           ),
//         ),
//      //   SizedBox(width: 20 / 2)
//       ],
//     ),
//      // ignore: missing_return
//      body: Obx(() {
//     //  if(econtroller.isChange(true)){
//             if(econtroller.isLoading.value == true){
//               return Center(child: CircularProgressIndicator());}
//                else{
//               return  SmartRefresher(
//                 enablePullDown: true,
//                controller: _refreshController, // Use the same instance of RefreshController
//               onRefresh: () async {
//                 await econtroller.reloadEmployees();
//                 _refreshController.refreshCompleted(); // Complete the refresh operation
//               },child: SafeArea(
//         child: ListView.builder(
//           physics: AlwaysScrollableScrollPhysics(),
//           //physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
//           itemCount: econtroller.employees.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Chat(
//                econtroller.employees[index].name,
//                econtroller.employees[index].email,
//                econtroller.employees[index].id
//              //  econtroller.DeleteEmp()
//           /*    onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (ctx) => ChatScreen(
//                               personName: names[index],
//                               //colour: color,
//                             )));
//               },*/
//             );
            
//           },
//         ),
//       ),);
//        }
//      // }
//           },),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             backgroundColor: kPrimaryColor,
//             onPressed: () {
//              Navigator.push(
//                   context, MaterialPageRoute(builder: (ctx) => AddEmp()));
//             },
//             heroTag: null,
//             child: Icon(
//               Icons.edit,
//               size: 30,
//             ),
//           ),
      
//         ],
//       ),
//     );
//   }
// }

