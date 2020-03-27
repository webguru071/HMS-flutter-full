import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhms/LoginScreen/LoginScreen.dart';
import 'package:flutterhms/SplashScreen/Typo.dart';

import 'Admission/Admission.dart';
import 'Dashboard/DashboardScreen.dart';
import 'Emergency/Emergency.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _title = 'Dashboard';
  int selectedDrawerParent = 0;
  int selectedDrawerNavigableChild = 0;

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        //_title = 'Dashboard';
        return new Dashboard();
      case 1:
        //_title = 'Report';
        return new Emergency();
      case 2:
        //_title = 'Report';
        return new Admission();

      default:
        return new Box();
    }
  }

  onSelectItem(int index, String title) {
    setState(() {
      this._title = title;
      selectedDrawerNavigableChild = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50), // 44 is the height
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFF2247CA), Colors.blue],
                ),
              ),
            ),
           // backgroundColor: Color(0xFF2247CA),
            actions: <Widget>[
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
            title: new Text(
              this._title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        drawer: Drawer(
          //key: Key('builder ${selectedDrawerParent.toString()}'),
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: new Text("naw.andit@gmail.com"),
                accountName: new Text("Nafee Walee"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile_pic.png"),
                  ),
                  onTap: () => print("This is your current account."),
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                      child: new CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_picture2.jpg"),
                      ),
                      onTap: () {
                        print("This is your other account.");
                      }),
                ],
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage(
                            "assets/images/default_profile_banner.png"),
                        fit: BoxFit.fill)),
              ),
              ListTile(
                //leading: Image.asset('assets/images/dashboard_icon.png'),
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
                //selected: 0 == selectedDrawerNavigableChild,
                onTap: () => onSelectItem(0, 'Dashboard'),
              ),
              ListTile(
                leading: Icon(Icons.event_busy),
                title: Text('Emergency'),
                onTap: () => onSelectItem(1, 'Emergency'),
              ),
              ListTile(
                leading: Icon(Icons.insert_invitation),
                title: Text('Admission'),
                onTap: () => onSelectItem(2, 'Admission'),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Beds'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
              ListTile(
                leading: Icon(Icons.games),
                title: Text('Services'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
              ListTile(
                leading: Icon(Icons.departure_board),
                title: Text('Doctors Department'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
              ListTile(
                leading: Icon(Icons.local_hospital),
                title: Text('Patients'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
              ListTile(
                leading: Icon(Icons.report_problem),
                title: Text('Report'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
              ListTile(
                leading: Icon(Icons.receipt),
                title: Text('Reference Category'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('Accounts'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
              ListTile(
                leading: Icon(Icons.casino),
                title: Text('Expense'),
                onTap: () => onSelectItem(1, 'Beds'),
              ),
            ],
          ),
        ),
        body: getDrawerItemWidget(selectedDrawerNavigableChild));
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
    } else if (choice == Constants.SignOut) {
      _showDialog(context);
    }
  }

  // user defined function
  void _showDialog(BuildContext context) {
// flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sign Out"),
          content: new Text("Do you wish to log out?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Logout"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => LoginScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 500)));
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
}

class Constants {
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[Settings, SignOut];
}
