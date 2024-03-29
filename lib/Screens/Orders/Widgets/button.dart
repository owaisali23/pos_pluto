import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/constants.dart';

class CounterController extends GetxController {
  RxInt value = 1.obs;

  void increment() {
    value++;
  }

  void decrement() {
    if (value > 1) {
      value--;
    }
  }
}

class Buttons extends StatelessWidget {
  final CounterController _controller = Get.put(CounterController());


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 280),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kPrimaryColor,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: _controller.decrement,
            child: Icon(
              Icons.remove,
              color: Colors.white,
              size: 12,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height / 300,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height / 280,
              vertical: MediaQuery.of(context).size.height / 380,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
            ),
            child: Obx(
              () => Text(
                '${_controller.value}',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
          ),
          InkWell(
            onTap: _controller.increment,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_auth/constants.dart';

// class Buttons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                   padding: EdgeInsets.all(MediaQuery.of(context).size.height/280),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: kPrimaryColor),
//                   child: Row(
//                     children: [
//                       InkWell(
//                           onTap: () {},
//                           child: Icon(
//                             Icons.remove,
//                             color: Colors.white,
//                             size: 12,
//                           )),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/300),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/280, vertical: MediaQuery.of(context).size.height/380,),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3),
//                             color: Colors.white),
//                         child: Text(
//                           '1',
//                           style: TextStyle(color: Colors.black, fontSize: 13),
//                         ),
//                       ),
//                       InkWell(
//                           onTap: () {},
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                             size: 12,
//                           )),
//                     ],
//                   ),
//                 );
//   }
// }