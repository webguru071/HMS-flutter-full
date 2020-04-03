import 'package:flutter/material.dart';


class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> with SingleTickerProviderStateMixin {

  List<Widget> containers = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 55), // 44 is the height
          child:    AppBar(
            //title: Text('Sample'),
            bottom: TabBar(

              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0),
                //insets: EdgeInsets.symmetric(horizontal:16.0)
              ),
              tabs: <Widget>[
                Tab(

                  text: 'Todays Report',
                ),
                Tab(
                  text: 'Expense Report',
                ),
                Tab(

                  text: 'Cash Flow',
                ),
                Tab(
                  text: 'Today',
                ),
              ],
            ),
          ),
        ),

        body: TabBarView(
          children: containers,
        ),
      ),
    );
  }
}