import 'package:flutter/material.dart';
import 'package:flutterhms/MainScreen/Animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutterhms/MainScreen/Dashboard/AdmissionHistoryBarChart.dart';
import 'package:flutterhms/MainScreen/Dashboard/BillsTable.dart';
import 'package:flutterhms/MainScreen/Dashboard/TransactionTable.dart';
import 'package:flutterhms/MainScreen/Dashboard/LineChart.dart';
import 'dart:async';
import 'dart:convert';

import 'SummaryDetails.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class DashboardSummaryItems {
  final String img;
  final String title;
  final String amount;

  DashboardSummaryItems(this.img, this.title, this.amount);
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
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  _DashboardState() {
   // items.add(new DashboardItems("assets/images/android.png", "Summary", SummaryPage()));
    items.add(new DashboardItems("assets/images/android.png", "Admission", AdmissionBarChart()));
    //items.add(new DashboardItems("assets/images/android.png", "Pie",SummaryTransactionPieChart()));
   // items.add(new DashboardItems("assets/images/android.png", "Line", LineChart()));
    items.add(new DashboardItems("assets/images/android.png", "Bills", BillsTable()));
    items.add(new DashboardItems("assets/images/android.png", "Transaction", TransactionTable()));
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    // Get json result and convert it to model. Then add

    setState(() {
      _dashDetails.clear();
      getFutureTransDetails();
    });

    return null;
  }

  Future<Null> getFutureTransDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);
    setState(() {
      for (Map user in responseJson) {
        _dashDetails.add(DashboardDetails.fromJson(user));
        print(_dashDetails[0].grandTotal.toString());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startLoading();
    refreshList();
  }
  _startLoading() async {
    refreshKey.currentState.show();
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
                      child: Image.asset(items[index].img, width: 100),
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
        body: RefreshIndicator(
      key: refreshKey,
      child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  itemCount: _dashDetails.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var f = _dashDetails[index];
                    //return new Card(child: new Text(_transDetails[index].id.toString()));
                    if (_dashDetails.length != null) {
                      return Container(
                          child: Column(
                        children: <Widget>[
                          Card(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset("assets/images/android.png",
                                        width: 50, height: 50),
                                    Column(
                                      children: <Widget>[
                                        Text("Grand Total"),
                                        Text(f.grandTotal.toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset("assets/images/android.png",
                                        width: 50, height: 50),
                                    Column(
                                      children: <Widget>[
                                        Text("Due collection"),
                                        Text(f.dueCollection.toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset("assets/images/android.png",
                                        width: 50, height: 50),
                                    Column(
                                      children: <Widget>[
                                        Text("Total Amount"),
                                        Text(f.amount.toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset("assets/images/android.png",
                                        width: 50, height: 50),
                                    Column(
                                      children: <Widget>[
                                        Text("Today's Invoice"),
                                        Text(f.invoiceToday.toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                    } else {
                      return new RefreshIndicator(
                        key:refreshKey,
                        child: Container(

                        ),
                        onRefresh: _startLoading,
                      );

                    }
                  }),
              GridView.builder(
                  itemCount: items.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return WidgetListAnimator(SuperHeroCell(context, index));
                  },
              ),
            ],
          )),
      onRefresh: refreshList,

    ));
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
          title:
              new Text(superHero.title, style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Center(
        child: Hero(
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
  final double grandTotal, dueCollection, amount;
  final int invoiceToday;

  DashboardDetails({
    this.grandTotal,
    this.dueCollection,
    this.amount,
    this.invoiceToday,
  });

  factory DashboardDetails.fromJson(Map<String, dynamic> json) {
    return new DashboardDetails(
        grandTotal: double.parse(json['grand_total']),
        dueCollection: double.parse(json['due_collection']),
        amount: double.parse(json['amount']),
        invoiceToday: json['invoice_today']);
  }
}
