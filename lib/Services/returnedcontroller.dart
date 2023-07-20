import 'dart:convert';
import 'package:flutter_auth/Models/returnedlistModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReturnedProductController extends GetxController {
  var isLoading = true.obs;
  var returnedprod = List<ReturnedProduct>().obs;
  var filteredProducts = List<ReturnedProduct>().obs;
  var refreshController = RefreshController();

  @override
  void onInit() {
    fetchReturnedProducts();
    super.onInit();
  }

  Future<List<ReturnedProduct>> getReturnedProducts() async {
    final String tokenKey = 'auth_token';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey) ?? '';

    if (token.isNotEmpty) {
      final response = await http.get(
        Uri.parse('https://pos-pluto-server.vercel.app/api/v1/returned'),
        headers: {
          'Authorization': token,
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final ReturnedProductResponse retResponse = ReturnedProductResponse.fromJson(data);
        final List<ReturnedProduct> products = retResponse.result;
        return products;
      } else {
        print('Error');
        throw Exception('API call failed');
      }
    } else {
      throw Exception('Token not found');
    }
  }

  void fetchReturnedProducts() async {
    try {
      isLoading(true);
      var products = await getReturnedProducts();

      if (products != null) {
        returnedprod.value = products;
        filteredProducts.value = products;
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      refreshController.refreshCompleted();
    }
  }

  void filterProducts(String searchTerm) {
    if (searchTerm.isEmpty) {
      filteredProducts.value = returnedprod;
    } else {
      filteredProducts.value = returnedprod
          .where((product) => product.productDetails.name.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }
  }

  void resetFilter() {
    filteredProducts.value = returnedprod;
  }

  void reloadReturnedProducts() {
    fetchReturnedProducts();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
