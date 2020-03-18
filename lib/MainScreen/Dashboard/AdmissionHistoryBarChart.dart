/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class AdmissionBarChart extends StatefulWidget {
  @override
  _AdmissionBarChartState createState() => _AdmissionBarChartState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _AdmissionBarChartState extends State<AdmissionBarChart> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('2016', 12, Colors.blue),
      ClicksPerYear('2017', 30, Colors.redAccent),
      ClicksPerYear('2018', _counter, Colors.orange),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
        labelAccessorFn: (ClicksPerYear row, _) => '${row.clicks}',

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
                labelPosition: charts.BarLabelPosition.inside),
        ),

    );


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.00),
              child:Text('You have pushed the button this many times:'),

            ),

            Expanded(
                child:Container(
                  padding: EdgeInsets.all(10.00),
                  margin: EdgeInsets.only(bottom: 10.00),
                  child: chart,
                )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.red,
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.yellow,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
