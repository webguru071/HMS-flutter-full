import 'package:flutter/material.dart';
import 'package:flutterhms/SplashScreen/Typo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExpansionTileTest extends StatefulWidget {
  @override
  _ExpansionTileTestState createState() => _ExpansionTileTestState();
}

class _ExpansionTileTestState extends State<ExpansionTileTest> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pushing data'),
      ),
      drawer: Drawer(
        child: Card(
          child: Column(
            children: <Widget>[
              ExpansionPanelList(
                expansionCallback: (int index, bool status) {
                  if (status == true) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text('Alert Dialog'),
                          content: new Text('What do you want to do?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Cancel'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            FlatButton(
                              child: Text(
                                'Collapse',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                setState(() {
                                  expanded = false;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    setState(() {
                      expanded = true;
                    });
                  }
                },
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: expanded,
                    headerBuilder: (BuildContext context, bool expanded) {
                      return Text('Expansion Panel Header');
                    },
                    body: Center(


                        child: Text('Expanded panel body'),

                    ),
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    isExpanded: expanded,
                    headerBuilder: (BuildContext context, bool expanded) {
                      return Text('Expansion Panel Header');
                    },
                    body: Center(


                      child: Text('Expanded panel body'),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
          child: Text("test"),
      ),
      );
  }
}