import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDemo extends StatefulWidget {
  const ChartDemo({Key? key}) : super(key: key);

  @override
  _ChartDemoState createState() => _ChartDemoState();
}

class SalesData {
  SalesData(this.year, this.sales);
  final int year;
  final int sales;
}



class _ChartDemoState extends State<ChartDemo> {

  _ChartDemoState(){
    timer = Timer.periodic(const Duration(seconds: 1), _updateDataSource);
  }


  Timer? timer;
  int count=20;
  ChartSeriesController? _chartSeriesController;
  List<SalesData> data = <SalesData>[
    SalesData(0, 42),
    SalesData(1, 47),
    SalesData(2, 33),
    SalesData(3, 49),
    SalesData(4, 54),
    SalesData(5, 41),
    SalesData(6, 58),
    SalesData(7, 51),
    SalesData(8, 98),
    SalesData(9, 41),
    SalesData(10, 53),
    SalesData(11, 72),
    SalesData(12, 86),
    SalesData(13, 52),
    SalesData(14, 94),
    SalesData(15, 92),
    SalesData(16, 86),
    SalesData(17, 72),
    SalesData(18, 94),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              elevation: 2,
              child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis:
                      NumericAxis(majorGridLines: const MajorGridLines(width: 0),isVisible: false),
                  primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(size: 0),isVisible: false),
                  series: <AreaSeries<SalesData, int>>[
                    AreaSeries<SalesData, int>(
                        dataSource: data,
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartSeriesController = controller;
                        },
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                    gradient: LinearGradient(
                        colors: <Color>[Colors.green[50]!, Colors.green[200]!, Colors.green],
                        stops: const <double>[0.0, 0.4, 1.0],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }


  void _updateDataSource(Timer timer) {
    data.add(SalesData(count, _getRandomInt(10, 100)));
    if (data.length == 20) {
      data.removeAt(0);
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[data.length- 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[data.length - 1],
      );
    }
    count = count + 1;
  }

  int _getRandomInt(int min, int max) {
    final math.Random _random = math.Random();
    return min + _random.nextInt(max - min);
  }

}
