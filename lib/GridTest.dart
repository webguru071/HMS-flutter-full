import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'HeroWidTest.dart';

class GridTester extends StatefulWidget {
  @override
  _GridTesterState createState() => new _GridTesterState();
}

class _GridTesterState extends State<GridTester> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    var gridView = new GridView.builder(
        itemCount: 6,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10),
              child: new Card(
                color: Theme.of(context).cursorColor,
                elevation: 5.0,
                child: new Container(
                  alignment: Alignment.center,
                  child: new Text('Item $index'),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage()));
            },
          );
        });

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter TabBar"),
        ),
        body: gridView,
      ),
    );
  }
}