import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Dropdown extends StatefulWidget {
  final ValueChanged<String> onSelected; // Callback function

  const Dropdown({Key key, this.onSelected}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  var _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Container(
          height: 35,
          width: 200,
          child: DropdownButton(
            underline: SizedBox(),
            hint: _dropDownValue == null
                ? Text(
                    'Roles',
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    _dropDownValue,
                    style: TextStyle(color: Colors.white),
                  ),
            isExpanded: true,
            iconSize: 30.0,
            iconEnabledColor: Colors.white,
            style: TextStyle(color: kPrimaryColor),
            items: [
              'SALESMANAGER',
              'INVENTORYMANAGER',
              'STOREOWNER',
            ].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(() {
                _dropDownValue = val;
                // Pass the selected value back to the parent class using a callback function.
                widget.onSelected(val);
              });
            },
          ),
        ),
      ),
    );
  }
}
