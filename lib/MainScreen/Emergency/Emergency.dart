import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> with SingleTickerProviderStateMixin {

  List<Widget> containers = [
    Container(
        child: EmergencyTable(),
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




class EmergencyTable extends StatefulWidget {
  @override
  _EmergencyTableState createState() => new _EmergencyTableState();
}

class _EmergencyTableState extends State<EmergencyTable> {
  int idFlag = 0,dateFlag = 0,amountFlag=0,transFlag=0;
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getFutureTransDetails() async {
    print('hello');
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

    getFutureTransDetails();
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
            color: Theme.of(context).cursorColor,
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[

                  Expanded(
                    flex: 1,
                    child:  new GestureDetector(
                      onTap: () {
                        setState(() { if(idFlag==0){
                          _transDetails.sort((a, b) => a.id.compareTo(b.id));
                          idFlag=1;
                        }
                        else{
                          _transDetails.sort((b, a) => a.id.compareTo(b.id));
                          idFlag=0;
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
                        setState(() { if(dateFlag==0){
                          _transDetails.sort((a, b) => a.date.compareTo(b.date));
                          dateFlag=1;
                        }
                        else{
                          _transDetails.sort((b, a) => a.date.compareTo(b.date));
                          dateFlag=0;
                        }
                        });

                      },
                      child: Text("Patient Name"),
                    ),
                  ),


                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() { if(transFlag==0){
                          _transDetails.sort((a, b) => a.transId.compareTo(b.transId));
                          transFlag=1;
                        }
                        else{
                          _transDetails.sort((b, a) => a.transId.compareTo(b.transId));
                          transFlag=0;
                        }
                        });

                      },
                      child: Text("Invoice"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() { if(amountFlag==0){
                          _transDetails.sort((a, b) => a.amount.compareTo(b.amount));
                          amountFlag=1;
                        }
                        else{
                          _transDetails.sort((b, a) => a.amount.compareTo(b.amount));
                          amountFlag=0;
                        }
                        });

                      },
                      child: Text("Paid Amount"),
                    ),
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
                    padding:
                    EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(_transDetails[i].id.toString()),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(_transDetails[i].date),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(_transDetails[i].transId),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(_transDetails[i].amount),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
                : new ListView.builder(
              shrinkWrap: true,
              itemCount: _transDetails.length,
              itemBuilder: (context, index) {
                var f = _transDetails[index];
                return new Card(
                  child: Container(
                    padding:
                    EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(f.id.toString()),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(f.date),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(f.transId),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(f.amount),
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
      if (transDetail.amount.contains(text.toLowerCase()) ||
          transDetail.amount.toLowerCase().contains(text.toUpperCase()))
        _searchResult.add(transDetail);
    });
    setState(() {});
  }
}

List<TransactionDetails> _searchResult = [];

List<TransactionDetails> _transDetails = [];

final String url =
    'https://nafeewalee.000webhostapp.com/android_connection/CashFlow/NavCashFlowFragment.php';

class TransactionDetails {
  final int id;
  final String date, transId;
  final String amount;

  TransactionDetails({
    this.id,
    this.date,
    this.transId,
    this.amount,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return new TransactionDetails(
      id: json['transactions.id'],
      date: json['transactions.date'],
      transId: json['transactions.trans_id'],
      amount: json['transactions.amount'],
    );
  }
}
