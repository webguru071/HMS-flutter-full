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
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
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

    getUserDetails();
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
                  onChanged: onSearchTextChanged,
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.search),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
          Card(
            color:Theme.of(context).cursorColor,
            child: Container(
              padding: EdgeInsets.only(left:10,top:10,bottom:10),
              child: Row(
                children: <Widget>[
                 Expanded(
                   child: Text("ID"),
                 ),
                  Expanded(
                    child: Text("Date"),
                  ),
                  Expanded(
                    child: Text("Invoice"),
                  ),
                  Expanded(
                    child: Text("Amount"),
                  ),
                ],
              ),
            ),
          ),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return new Card(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(_transDetails[i].id.toString()),
                              ),
                              Expanded(
                                child: Text(_transDetails[i].date),
                              ),
                              Expanded(
                                child: Text(_transDetails[i].transId),
                              ),
                              Expanded(
                                child: Text(_transDetails[i].amount.toString()),
                              )

                            ],
                          ),
                        ),
                      );
                    },
                  )
                : new ListView.builder(
                    itemCount: _transDetails.length,
                    itemBuilder: (context, index) {
                      return new Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(_transDetails[index].id.toString()),
                                ),
                                Expanded(
                                  child: Text(_transDetails[index].date),
                                ),
                                Expanded(
                                  child: Text(_transDetails[index].transId),
                                ),
                                Expanded(
                                  child: Text(_transDetails[index].amount.toString()),
                                )

                              ],
                            ),
                          ),
                      );
                    },
                  ),
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

    _transDetails.forEach((transDetail) {
      if (transDetail.date.contains(text) || transDetail.transId.contains(text)) _searchResult.add(transDetail);
    });

    setState(() {});
  }
}

List<TransactionDetails> _searchResult = [];

List<TransactionDetails> _transDetails = [];

final String url = 'https://nafeewalee.000webhostapp.com/CashFlow/NavCashFlowFragment.php';

class TransactionDetails {
  final int id;
  final String date, transId;
  final double amount;

  TransactionDetails(
      {this.id,
      this.date,
      this.transId,
        this.amount,
          });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return new TransactionDetails(
      id: json['transactions.id'],
      date: json['transactions.date'],
      transId: json['transactions.trans_id'],
      amount : json['transactions.amount'],
    );
  }
}
