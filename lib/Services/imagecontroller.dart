import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageController extends GetxController {
  var isLoading = false.obs;
  RxString completeUrl = "".obs;

  Future<String> imageApi(String imageUrl) async {
    final String tokenKey = 'auth_token';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey) ?? '';

    isLoading(true);

    try {
      final response = await get(
        Uri.parse('https://pos-pluto-server.vercel.app/api/v1/image/$imageUrl/'),
        headers: {
          'Authorization': token,
        },
      ).timeout(
        // Set the desired timeout duration in milliseconds (adjust as needed).
        Duration(seconds: 120),
        onTimeout: () {
          throw TimeoutException('Timeout occurred');
        },
      );

      if (response.statusCode == 200) {
        var completeUrl = jsonDecode(response.body);
        isLoading(false);
        print("Image Displayed");

        // Update the value of completeUrl
        this.completeUrl.value = completeUrl;
        return completeUrl;
      } else {
        print("Image Displaying Failed");
        isLoading(false);
        return '';
      }
    } on TimeoutException catch (e) {
      print("Timeout occurred: $e");
      isLoading(false);
      return '';
    } catch (e) {
      print("Error fetching image URL: $e");
      isLoading(false);
      return '';
    }
  }
}
