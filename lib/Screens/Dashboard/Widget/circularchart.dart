import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/models.dart';
import 'package:flutter_auth/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({Key? key}) : super(key: key);

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
        child: SfCircularChart(
            legend: Legend(
              //  margin: EdgeInsets.zero,
                isVisible: true,
                width: "130",
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) {
                  return Container(
                    padding:  EdgeInsets.only(top: 10),
                    width: 174,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: point.color),
                              height: 8,
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                point.x.toString(),
                                style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9.0, 8, 15, 9),
                          child: Row(
                            children: [
                              Text(
                                point.y.toString(),
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.mobile,
                  yValueMapper: (ChartData data, _) => data.sale,
                  innerRadius: '50%'),
            ],
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Container(
                    child: const Text(
                  'Products',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                )),
              )
            ])),
    );
  }
}