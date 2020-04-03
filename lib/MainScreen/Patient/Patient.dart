import 'package:flutter/material.dart';


class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> with SingleTickerProviderStateMixin {

  List<Widget> containers = [
    Container(
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
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
                  text: 'Patient',
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