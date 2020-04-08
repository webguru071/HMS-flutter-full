import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'MainScreen/Dashboard/AdmissionHistoryBarChart.dart';
import 'MainScreen/Dashboard/BillsTable.dart';
import 'MainScreen/Dashboard/LineChart.dart';
import 'MainScreen/Dashboard/SummaryDetails.dart';
import 'MainScreen/Dashboard/TransactionTable.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class DashboardItems {
  final String img;
  final String title;
  final Class;

  DashboardItems(this.img, this.title, this.Class);
}

class _MyHomePageState extends State<MyHomePage> {
  List<DashboardItems> items = new List<DashboardItems>();

  _MyHomePageState() {
    items.add(new DashboardItems("assets/images/apple.png", "Summary",SummaryPage()));
    items.add(new DashboardItems("assets/images/apple.png", "Admission",AdmissionBarChart()));
    items.add(new DashboardItems("assets/images/android.png", "Pie",PieChart()));
    items.add(new DashboardItems("assets/images/android.png", "Line",LineChart()));
    items.add(new DashboardItems("assets/images/apple.png", "Bills",BillsTable()));
    items.add(new DashboardItems("assets/images/android.png", "Transaction",TransactionTable()));
}

  Widget SuperHeroCell(BuildContext ctx, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyDetailPage(items[index])));

      },
      child: Card(
          margin: EdgeInsets.all(8),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      tag: items[index],
                      child: Image.asset(items[index].img,
                      width:100),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      items[index].title,
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.navigate_next, color: Colors.black38),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            GridView.builder(
              itemCount: items.length,
              gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => SuperHeroCell(context, index),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class MyDetailPage extends StatefulWidget {
  DashboardItems _superHero;

  MyDetailPage(DashboardItems superHero) {
    _superHero = superHero;
  }

  @override
  _MyDetailPageState createState() => _MyDetailPageState(_superHero);
}

class _MyDetailPageState extends State<MyDetailPage> {
  DashboardItems superHero;

  _MyDetailPageState(DashboardItems superHero) {
    this.superHero = superHero;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child:Hero(
                transitionOnUserGestures: true,
                tag: superHero,
                child: Transform.scale(
                  scale: 1,
                  child: superHero.Class,
                ),
              ),
    ),
    );
}}