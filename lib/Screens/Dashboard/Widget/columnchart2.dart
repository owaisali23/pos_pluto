import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart2 extends StatelessWidget {
  const ColumnChart2({Key key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Card(
     // margin: EdgeInsets.all(20),
     // color: Color.fromARGB(255, 247, 246, 246),
      child: Container(
        height: 140,
        width: 195,
       padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
           /*primaryXAxis: CategoryAxis(
                            // X axis is hidden now
                            isVisible: false
                        ),
            primaryYAxis: CategoryAxis(
                            // X axis is hidden now
                            isVisible: false
                        ), */            
         primaryXAxis: 
           CategoryAxis(
           majorGridLines: const MajorGridLines(width: 0)
           ),
           primaryYAxis:         
             CategoryAxis(
           majorGridLines: const MajorGridLines(width: 0)
           ),
           isTransposed: true,
          title: ChartTitle(
              text: 'Sales History:',
              textStyle: const TextStyle(fontSize: 10),
            //  backgroundColor: Colors.white,
            //  borderColor: Colors.black,
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
              borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
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