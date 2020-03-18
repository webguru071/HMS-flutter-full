import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhms/LoginScreen/LoginScreen.dart';
import 'package:flutterhms/SplashScreen/Typo.dart';

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

        appBar: new AppBar(
          backgroundColor: Colors.black ,
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return Constants.choices.map((String choice){
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
        drawer: Drawer(
          //key: Key('builder ${selectedDrawerParent.toString()}'),
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/android&ios.png"),
                      fit: BoxFit.cover),
                ),
                child: Text("Header"),
              ),
              ListTile(
                //leading: Image.asset('assets/images/dashboard_icon.png'),
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
                selected: 0 == selectedDrawerNavigableChild,
                onTap: () => onSelectItem(0, 'Dashboard'),
              ),
              ExpansionTile(
                leading: Icon(Icons.android),
                title: Text("Emergency"),
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Emergency List'),
                    selected: 1 == selectedDrawerNavigableChild,
                    onTap: () => onSelectItem(1, 'Report'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Voided'),
                    selected: 1 == selectedDrawerNavigableChild,
                    onTap: () => onSelectItem(1, 'Report'),
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.phone_iphone),
                title: Text("Admissions"),
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Admissions List'),
                    selected: 2 == selectedDrawerNavigableChild,
                    onTap: () => onSelectItem(1, 'Report'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Voided'),
                    selected: 2 == selectedDrawerNavigableChild,
                    onTap: () => onSelectItem(1, 'Report'),
                  ),
                ],

              ),
            ],
          ),
        ),
        body: getDrawerItemWidget(selectedDrawerNavigableChild));
  }

  void choiceAction(String choice){
    if(choice == Constants.Settings){

    }else if(choice == Constants.SignOut){
      Navigator.pushReplacement(
          context, PageRouteBuilder(
          pageBuilder: (c, a1, a2) => LoginScreen(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 500)));
    }
  }
}

class Constants{
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
    Settings,
    SignOut
  ];
}

