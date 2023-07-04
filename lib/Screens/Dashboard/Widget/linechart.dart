import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth/Screens/Dashboard/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  const LineChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
    //  margin: EdgeInsets.all(20),
      color: Color.fromARGB(255, 247, 246, 246),
      child: Container(
        height: 180,
        width: 195,
       // padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,
          primaryXAxis: 
           CategoryAxis(
           majorGridLines: const MajorGridLines(width: 0)
           ),
           primaryYAxis:         
             CategoryAxis(
           majorGridLines: const MajorGridLines(width: 0)
           ),
          // isTransposed: x,
          title: ChartTitle(
              text: 'Sales History:',
              textStyle: const TextStyle(fontSize: 10)
            //  backgroundColor: Colors.white,
            //  borderColor: Colors.black,
              //  borderWidth: 1,
              // Aligns the chart title to left
            //  alignment: ChartAlignment.center,
              /*textStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
               // fontStyle: FontStyle.normal,
                fontSize: 14,
              )*/),
          series: <ChartSeries>[
            // Renders line chart
            LineSeries<ChartDataInfo, String>(
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