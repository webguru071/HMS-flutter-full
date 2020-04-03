import 'package:flutter/material.dart';


class Beds extends StatefulWidget {
  @override
  _BedsState createState() => _BedsState();
}

class _BedsState extends State<Beds> with SingleTickerProviderStateMixin {

  List<Widget> containers = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.white,
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
                  text: 'Types',
                ),
                Tab(
                  text: 'Beds',
                ),
                Tab(
                  text: 'Map',
                ),
                Tab(
                  text: 'Charge',
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