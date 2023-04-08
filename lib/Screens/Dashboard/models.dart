import 'package:flutter_auth/constants.dart';
import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.mobile, this.sale, [this.color]);

  final String mobile;
  final double sale;
  final Color? color;
}

class ChartDataInfo {
  ChartDataInfo(this.year, this.value, [this.color]);

  final String year;
  final double value;
  final Color? color;
}

final List<ChartData> chartData = [
  ChartData('Product 1', 80.5,kPrimaryColor),
  ChartData('Product 2', 38, kPrimaryLightColor),
  ChartData('Product 3', 34, Color.fromARGB(255, 84, 168, 236)),
  ChartData('Product 4', 52, Color.fromARGB(255, 69, 212, 223)),
  ChartData('Product 5', 32, Color.fromARGB(255, 84, 236, 185)),
];

final List<ChartDataInfo> indexChart = [
  ChartDataInfo('10', 52, kPrimaryColor),
  ChartDataInfo('20', 343, kPrimaryColor),
  ChartDataInfo('30', 108, kPrimaryColor),
  ChartDataInfo('40', 222, kPrimaryColor),
  ChartDataInfo('50', 308, kPrimaryColor),
  ChartDataInfo('60', 47, kPrimaryColor),
  ChartDataInfo('70', 112, kPrimaryColor),
  ChartDataInfo('80', 31, kPrimaryColor),
  ChartDataInfo('90', 207, kPrimaryColor),
  ChartDataInfo('10', 33, kPrimaryColor),
  ChartDataInfo('20', 143, kPrimaryColor),
  ChartDataInfo('30', 318, kPrimaryColor),
  ChartDataInfo('400', 122, kPrimaryColor),
  ChartDataInfo('50', 108, kPrimaryColor),
  ChartDataInfo('60', 381, kPrimaryColor),
  ChartDataInfo('300', 212, kPrimaryColor),
  ChartDataInfo('200', 31, kPrimaryColor),
  ChartDataInfo('400', 117, kPrimaryColor),
];