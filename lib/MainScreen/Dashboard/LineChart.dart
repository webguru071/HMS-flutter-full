import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChart extends StatefulWidget {
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    final data = [

      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
      new LinearSales(4, 50),
      new LinearSales(5, 250),
      new LinearSales(6, 100),
      new LinearSales(7, 7),
      new LinearSales(8, 35),
      new LinearSales(9, 2),
      new LinearSales(10, 190),
      new LinearSales(11, 75),
      new LinearSales(12, 15),
    ];

    var series = [
      charts.Series(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales sales, _) => '${sales.month}',
      ),
    ];
    var chart = new charts.LineChart(series, animate: true);

      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15.00, bottom: 5.0),
                child: Text('Transaction History of this year'),

              ),

              Expanded(
                  child: Container(
                    //padding: EdgeInsets.all(10.00),
                    margin: EdgeInsets.only(
                        top: 10.00, bottom: 10.00, left: 5.00, right: 5.00),
                    child: chart,
                  )
              ),
            ],
          ),
        ),
      );
  }
}

/// Sample linear data type.
class LinearSales {
  final int month;
  final int sales;

  LinearSales(this.month, this.sales);
}