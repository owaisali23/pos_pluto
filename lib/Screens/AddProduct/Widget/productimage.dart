import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:image_picker/image_picker.dart';

class AddImageCard extends StatelessWidget {
  final Function(String) onImageSelected;

  const AddImageCard({Key key, this.onImageSelected}) : super(key: key);

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64String = base64Encode(Uint8List.fromList(bytes));
      // Call the onImageSelected callback with the base64String as an argument
      onImageSelected(base64String);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _getImageFromGallery(context),
      child: Container(
        height: 140,
        width: 280,
        decoration: BoxDecoration(
          color: Color(0xFF6A6C93).withOpacity(0.09),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Color(0xFFEBE8F6),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 53,
              width: 53,
              child: Icon(
                Icons.add,
                size: 35,
                color: kPrimaryColor,
              ),
            ),
            Text(
              "Product Image",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
