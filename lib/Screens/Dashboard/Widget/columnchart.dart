import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
      //set border radius more than 50% of height and width to make circle
    ),
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Container(
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
           isTransposed: false,
          title: ChartTitle(
              text: 'Total Sales :',
              textStyle: const TextStyle(
              fontFamily: 'Roboto',
               fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                fontSize: 14,)
             // backgroundColor: Colors.white,
              //borderColor: Colors.black,
              //  borderWidth: 1,
              // Aligns the chart title to left
             // alignment: ChartAlignment.center,
              /*textStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
               // fontStyle: FontStyle.normal,
                fontSize: 14,
              )*/),
          series: <ChartSeries>[
            // Renders line chart
            ColumnSeries<ChartDataInfo, String>(
              dataSource: indexChart,
              pointColorMapper: (ChartDataInfo data, _) => data.color,
              xValueMapper: (ChartDataInfo data, _) => data.year,
              yValueMapper: (ChartDataInfo data, _) => data.value,
            ),
          ],
        )),
    );
  }
}