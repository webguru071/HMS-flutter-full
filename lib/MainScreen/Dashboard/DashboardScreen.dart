import 'package:flutter/material.dart';
import 'package:flutterhms/MainScreen/Animator.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:flutterhms/MainScreen/Dashboard/AdmissionHistoryBarChart.dart';
import 'package:flutterhms/MainScreen/Dashboard/BillsTable.dart';
import 'package:flutterhms/MainScreen/Dashboard/TransactionTable.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutterhms/MainScreen/Dashboard/PieChart.dart';
import 'package:flutterhms/MainScreen/Dashboard/LineChart.dart';

import 'SummaryDetails.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class DashboardSummaryItems {
  final String img;
  final String title,details;

  DashboardSummaryItems(this.img, this.title, this.details);
}

class DashboardItems {
  final String img;
  final String title;
  final Class;

  DashboardItems(this.img, this.title, this.Class);
}

class _DashboardState extends State<Dashboard> {
  List<DashboardItems> items = new List<DashboardItems>();
  List<DashboardSummaryItems> summaryItems = new List<DashboardSummaryItems>();

  _DashboardState() {
    items.add(new DashboardItems("assets/images/android.png", "Summary",SummaryPage()));
    items.add(new DashboardItems("assets/images/android.png", "Admission",AdmissionBarChart()));
    //items.add(new DashboardItems("assets/images/android.png", "Pie",SummaryTransactionPieChart()));
    items.add(new DashboardItems("assets/images/android.png", "Line",LineChart()));
    items.add(new DashboardItems("assets/images/android.png", "Bills",BillsTable()));
    items.add(new DashboardItems("assets/images/android.png", "Transaction",TransactionTable()));

    summaryItems.add(new DashboardSummaryItems("assets/images/android.png","Title","Deatils"));
    summaryItems.add(new DashboardSummaryItems("assets/images/android.png","Title","Deatils"));
    summaryItems.add(new DashboardSummaryItems("assets/images/android.png","Title","Deatils"));
    summaryItems.add(new DashboardSummaryItems("assets/images/android.png","Title","Deatils"));

  }

  Widget DashSummaryCell(BuildContext ctx, int pos) {
    return GestureDetector(
      onTap: () {
      },
      child:   Card(
        child: Container(
          padding:
          EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Image.asset(summaryItems[pos].img,
                  width:20,
              height: 20),

              Column(
                children: <Widget>[
                  Text(summaryItems[pos].title),

                  Text(summaryItems[pos].details),

                ],
              )
            ],
          ),
        ),
      ),
    );
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
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2247CA),
                    Color(0xFF3062D5),
                    Color(0xFF3982DD),
                    Color(0xFF449CE6),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 100.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: summaryItems.length,
              itemBuilder: (context, pos) {
                return WidgetListAnimator(
                    DashSummaryCell(context,pos)
                );
              },
            ),
            GridView.builder(
              itemCount: items.length,
              gridDelegate:

              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return WidgetListAnimator(
                    SuperHeroCell(context, index)
                );
              }
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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50), // 44 is the height
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xFF2247CA), Colors.blue],
              ),
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: new Text(superHero.title,style: TextStyle(color: Colors.white)
        ),
      ),
    ),
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
  }
}
List<DashboardDetails> _dashDetails = [];

final String url =
    'https://nafeewalee.000webhostapp.com/flutter_connection/Dashboard/dashboard.php';

class DashboardDetails {

  final double grandTotal,dueCollection,amount;
  final int invoiceToday;

  DashboardDetails({
    this.grandTotal,
    this.dueCollection,
    this.amount,
    this.invoiceToday,
  });

  factory DashboardDetails.fromJson(Map<String, dynamic> json) {
    return new DashboardDetails(
        grandTotal: json['grand_total'],
        dueCollection: json['due_collection'],
        amount:  double.parse(json['amount']),
        invoiceToday: json['invoice_today']);
  }
}