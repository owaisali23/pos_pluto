import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  var _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration( 
        //border: Border.all(color:kPrimaryColor, width:3),
        color:kPrimaryColor,
        borderRadius: BorderRadius.circular(6), //border raiuds of dropdown button
     ),
  
  child:Padding(
    padding: EdgeInsets.only(left:25, right:25),
     child: Container(
      height: 35,
      width: 200,
       child: DropdownButton(
        underline: SizedBox(),
        hint: _dropDownValue == null
            ? Text('Roles',style: TextStyle(color:Colors.white),)
            : Text(
                _dropDownValue,
                style: TextStyle(color:Colors.white),
              ),
        isExpanded: true,
        iconSize: 30.0,
        iconEnabledColor: Colors.white,
        style: TextStyle(color: kPrimaryColor),
        items: ['One', 'Two', 'Three'].map(
          (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          },
        ).toList(),
        onChanged: (val) {
          setState(
            () {
              _dropDownValue = val;
            },
          );
        },
    ),
     ),
  ),
  );
 }
} 