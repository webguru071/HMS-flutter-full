/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class AdmissionBarChart extends StatefulWidget {
  @override
  _AdmissionBarChartState createState() => _AdmissionBarChartState();
}



class _AdmissionBarChartState extends State<AdmissionBarChart> {
  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('Jan-11', 5, Colors.blue),
      ClicksPerYear('Jan-12', 7, Colors.blue),
      ClicksPerYear('Jan-13', 3, Colors.blue),
      ClicksPerYear('Jan-14', 5, Colors.blue),
      ClicksPerYear('Jan-15', 7, Colors.blue),
      ClicksPerYear('Jan-16', 8, Colors.blue),
      ClicksPerYear('Jan-17', 5, Colors.blue),
    //  ClicksPerYear('2018', _counter, Colors.orange),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.value,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
        labelAccessorFn: (ClicksPerYear row, _) => '${row.value}',

      ),
    ];

    var chart = new charts.BarChart(series,
        animate: true,
        barRendererDecorator:  new charts.BarLabelDecorator(
                   insideLabelStyleSpec: new charts.TextStyleSpec(
                       fontSize: 28, // size in Pts.
                       color: charts.MaterialPalette.black,
                   ),
                   outsideLabelStyleSpec: new charts.TextStyleSpec(
                     fontSize: 28, // size in Pts.
                     color: charts.MaterialPalette.black,
                   ),
        ),

        defaultRenderer: charts.BarRendererConfig(
            barRendererDecorator: charts.BarLabelDecorator(
                labelPosition: charts.BarLabelPosition.outside),
        ),

    );


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15.00,bottom: 5.0),
              child:Text('Admission List Of Last 7 Days'),

            ),

            Expanded(
                child:Container(
                  //padding: EdgeInsets.all(10.00),
                  margin: EdgeInsets.only(top: 10.00,bottom: 10.00,left: 5.00,right: 5.00),
                  child: chart,
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int value;
  final charts.Color color;

  ClicksPerYear(this.year, this.value, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}