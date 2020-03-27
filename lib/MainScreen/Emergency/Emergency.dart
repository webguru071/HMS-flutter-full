import 'package:flutter/material.dart';
import 'package:flutterhms/MainScreen/Dashboard/DashboardScreen.dart';
import 'package:flutterhms/SplashScreen/Typo.dart';


class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> with SingleTickerProviderStateMixin {

  List<Widget> containers = [
    Container(
      child: Dashboard(),
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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

                    text: 'Emergency List',
                  ),
                  Tab(
                    text: 'Voided',
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