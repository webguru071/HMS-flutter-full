import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionTable extends StatefulWidget {
  @override
  _TransactionTableState createState() => new _TransactionTableState();
}

class _TransactionTableState extends State<TransactionTable> {
  int idFlag = 0, dateFlag = 0, amountFlag = 0, transFlag = 0;
  TextEditingController controller = new TextEditingController();
  String filter;

  // Get json result and convert it to model. Then add
  Future<Null> getFutureTransDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _transDetails.add(TransactionDetails.fromJson(user));

      }
    });
  }

  @override
  void initState() {
    super.initState();
    _transDetails.clear();
      getFutureTransDetails();

    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Container(
            child: new Card(
              child: new ListTile(
                title: new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
          Card(
            color: Theme.of(context).cursorColor,
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: new GestureDetector(
                      onTap: () {
                        setState(() {
                          if (idFlag == 0) {
                            _transDetails.sort((a, b) => a.id.compareTo(b.id));
                            idFlag = 1;
                          } else {
                            _transDetails.sort((b, a) => a.id.compareTo(b.id));
                            idFlag = 0;
                          }
                        });
                      },
                      child: new Text("ID"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (dateFlag == 0) {
                            _transDetails.sort(
                                (a, b) => a.transType.compareTo(b.transType));
                            dateFlag = 1;
                          } else {
                            _transDetails.sort(
                                (b, a) => a.transType.compareTo(b.transType));
                            dateFlag = 0;
                          }
                        });
                      },
                      child: Text("TransID"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (transFlag == 0) {
                            _transDetails
                                .sort((a, b) => a.transId.compareTo(b.transId));
                            transFlag = 1;
                          } else {
                            _transDetails
                                .sort((b, a) => a.transId.compareTo(b.transId));
                            transFlag = 0;
                          }
                        });
                      },
                      child: Text("TransType"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (amountFlag == 0) {
                            _transDetails
                                .sort((a, b) => a.amount.compareTo(b.amount));
                            amountFlag = 1;
                          } else {
                            _transDetails
                                .sort((b, a) => a.amount.compareTo(b.amount));
                            amountFlag = 0;
                          }
                        });
                      },
                      child: Text("Amount"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Expanded(
            child: new ListView.builder(
                itemCount: _transDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  var f = _transDetails[index];
                  //return new Card(child: new Text(_transDetails[index].id.toString()));
                  if (filter == null || filter == "") {
                    return new Card(
                        child: new InkWell(
                          onTap: () {
                            _showDialog(context,index);
                          },
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(f.id.toString()),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transId),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transType),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.amount.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),);
                  } else if(_transDetails[index].id.toString().toLowerCase().contains(filter.toLowerCase())) {
                      return new Card(
                          child: new InkWell(
                            onTap: () {
                              _showDialog(context,index);
                            },
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(f.id.toString()),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(f.transId),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(f.transType),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(f.amount.toString()),
                              ),
                            ],
                          ),
                        ),
                      ),);
                    } else if(_transDetails[index].transId.toLowerCase().contains(filter.toLowerCase())) {
                    return new Card(
                        child: new InkWell(
                          onTap: () {
                            _showDialog(context,index);
                          },
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(f.id.toString()),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transId),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transType),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.amount.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),);
                  }else if(_transDetails[index].transType.toLowerCase().contains(filter.toLowerCase())) {
                    return new Card(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(f.id.toString()),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transId),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transType),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.amount.toString()),
                            ),
                          ],
                        ),
                      ),
                    );
                  }else if(_transDetails[index].amount.toString().toLowerCase().contains(filter.toLowerCase())) {
                    return new Card(
                        child: new InkWell(
                        onTap: () {
                      _showDialog(context,index);
                    },
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(f.id.toString()),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transId),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.transType),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(f.amount.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),);
                  }else {
                      return new Container();
                    }

                }),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
  }
}

List<TransactionDetails> _searchResult = [];

List<TransactionDetails> _transDetails = [];

final String url =
    'https://nafeewalee.000webhostapp.com/flutter_connection/Dashboard/transaction.php';

class TransactionDetails {
  final int id;
  final String transType, transId, description;
  final double amount;

  TransactionDetails({
    this.id,
    this.transId,
    this.transType,
    this.amount,
    this.description,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return new TransactionDetails(
        id: json['id'],
        transId: json['trans_id'],
        transType: json['transaction_type'],
        amount:  double.parse(json['amount']),
        description: json['description']);
  }
}
void _showDialog(BuildContext context, index) {
// flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(_transDetails[index].id.toString()),
        content: new Text("Do you wish to log out?"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Logout"),
            onPressed: () {
            },
          ),
          new FlatButton(
            child: new Text("Stay"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}