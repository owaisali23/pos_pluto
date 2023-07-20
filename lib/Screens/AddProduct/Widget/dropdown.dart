import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key key}) : super(key: key);

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
        color:kPrimaryLightColor,
        borderRadius: BorderRadius.circular(6), //border raiuds of dropdown button
     ),
  
  child:Padding(
    padding: EdgeInsets.only(left:25, right:25),
    
     child: Container(
      height: 50,
      width: 280,
       child: DropdownButton(  
     //   underline: SizedBox(),
        hint: _dropDownValue == null
            ? Text('Category')
            : Text(
                _dropDownValue,
                style: TextStyle(color:kPrimaryColor),
              ),
        isExpanded: true,
        iconSize: 30.0,
        iconEnabledColor: kPrimaryColor,
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