import 'package:flutter/material.dart';


class Operation extends StatefulWidget {
  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> with SingleTickerProviderStateMixin {

  List<Widget> containers = [
    Container(
      color: Colors.green,
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
      length: 3,
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
                  text: 'Services',
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