import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/employeeslistModel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeeListController extends GetxController {
  var isLoading = true.obs;
  var employees = List<Employee>().obs;
  var refreshController = RefreshController();

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  Future<List<Employee>> getEmployees() async {
    final String tokenKey = 'auth_token';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey) ?? '';

    if (token.isNotEmpty) {
      final response = await http.get(
        Uri.parse('https://pos-pluto-server.vercel.app/api/v1/users/employees'),
        headers: {
          'Authorization': token,
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final EmployeeResponse empResponse = EmployeeResponse.fromJson(data);
        final List<Employee> employees = empResponse.result;
        return employees;
      } else {
        print('Error');
        throw Exception('API call failed');
      }
    } else {
      throw Exception('Token not found');
    }
  }

  void fetchEmployees() async {
    try {
      isLoading(true);
      var employees = await getEmployees();

      if (employees != null) {
        this.employees.value = employees;
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

  void reloadEmployees() {
    fetchEmployees();
  }

  @override
  void dispose() {
    refreshController.dispose(); // Dispose the RefreshController when done
    super.dispose();
  }
}
