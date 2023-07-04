import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Line extends StatelessWidget {
  const Line({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
     // margin: EdgeInsets.all(20),
    //  color: Color.fromARGB(255, 247, 246, 246),
      child: Container(
        height: 140,
        width: 195,
       padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
         child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: 
           CategoryAxis(
           majorGridLines: const MajorGridLines(width: 0)
           ),
           primaryYAxis:         
             CategoryAxis(
           majorGridLines: const MajorGridLines(width: 0)
           ),
          // isTransposed: true,
            // primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(
              text: 'Half yearly Sales:',
              textStyle: const TextStyle(fontSize: 10),),
          
            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                dataSource:  <SalesData>[
                  SalesData('Jan', 15),
                  SalesData('Feb', 28),
                  SalesData('Mar', 67),
                  SalesData('Apr', 21),
                  SalesData('May', 31),
                  SalesData('Jun', 65),
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)
              )
            ]
          ),
       ),
      );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}