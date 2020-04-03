import 'package:flutter/material.dart';


class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> with SingleTickerProviderStateMixin {

  List<Widget> containers = [
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
                  text: 'Category',
                ),
                Tab(
                  text: 'Service',
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