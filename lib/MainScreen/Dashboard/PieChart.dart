import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterhms/MainScreen/Dashboard/InfiniteLoopTest.dart';
import 'package:pie_chart/pie_chart.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

class SummaryTransactionPieChart extends StatefulWidget {
  @override
  _SummaryTransactionPieChartState createState() => _SummaryTransactionPieChartState();
}

class _SummaryTransactionPieChartState extends State<SummaryTransactionPieChart> {
  bool toggle = false;
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.yellow,
    Colors.blue,

  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Purchase", () => 50000);
    dataMap.putIfAbsent("Sales", () => 30000);
    dataMap.putIfAbsent("Expense", () => 20000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.00),
            child: Text(
              'Summary of total transaction'
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30.00,top:10.00,right: 30.00,left:30.00),
            child: Center(
              child: toggle
                  ? PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width,
                showChartValuesInPercentage: false,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                colorList: colorList,
                showLegends: true,
                legendPosition: LegendPosition.top,
                decimalPlaces: 2,
                showChartValueLabel: false,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.black.withOpacity(1),
                ),
                chartType: ChartType.ring,
              )
                  : Text("Press FAB to show chart"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: togglePieChart,
        child: Icon(Icons.insert_chart),
      ),
    );
  }

  void togglePieChart() {
    setState(() {
      toggle = !toggle;
    });
  }
}