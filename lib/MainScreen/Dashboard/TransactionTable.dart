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
        _userDetails.add(UserDetails.fromJson(user));
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
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                 Expanded(
                   child: Text("First Name"),
                 ),
                  Expanded(
                    child: Text("Last Name"),
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
                        child: new ListTile(
                          title: new Text(_searchResult[i].firstName +
                              ' ' +
                              _searchResult[i].lastName),
                        ),
                        margin: const EdgeInsets.all(0.0),
                      );
                    },
                  )
                : new ListView.builder(
                    itemCount: _userDetails.length,
                    itemBuilder: (context, index) {
                      return new Card(
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(_userDetails[index].firstName),
                                ),
                                Expanded(
                                  child: Text(_userDetails[index].lastName),
                                ),
                                Expanded(
                                  child: Text('PUR-2020'),
                                ),
                                Expanded(
                                  child: Text("2000.00"),
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

    _userDetails.forEach((userDetail) {
      if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];

final String url = 'https://jsonplaceholder.typicode.com/users';

class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}
