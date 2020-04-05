import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhms/LoginScreen/LoginScreen.dart';
import 'package:flutterhms/MainScreen/Animator.dart';
import 'package:flutterhms/MainScreen/Beds/Beds.dart';
import 'package:flutterhms/MainScreen/Expense/Expense.dart';
import 'Accounts/Accounts.dart';
import 'Admission/Admission.dart';
import 'Dashboard/DashboardScreen.dart';
import 'DoctorsDepartment/DoctorsDepartment.dart';
import 'Emergency/Emergency.dart';
import 'Operation/Operation.dart';
import 'Patient/Patient.dart';
import 'ReferralCategory/ReferralCategory.dart';
import 'Reports/Reports.dart';
import 'Services/Services.dart';

class MainScreen extends StatefulWidget {
/*  MainScreen({this.username});

  final String username;
  String getValue(){
    return username;
  }*/

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String user = '';
  String _title = 'Dashboard';
  PageController _pageController;
  int _page = 0;


  List drawerItems = [
    {
      "icon": Icons.dashboard,
      "name": "Dashboard",
    },
    {
      "icon": Icons.event_busy,
      "name": "Emergency",
    },
    {
      "icon": Icons.games,
      "name": "Admission",
    },
    {
      "icon": Icons.memory,
      "name": "Operation",
    },
    {
      "icon": Icons.delete,
      "name": "Beds",
    },
    {
      "icon": Icons.add,
      "name": "Services",
    },
    {
      "icon": Icons.departure_board,
      "name": "Department",
    },
    {
      "icon": Icons.local_hospital,
      "name": "Patients",
    },
    {
      "icon": Icons.report_problem,
      "name": "Report",
    },
    {
      "icon": Icons.receipt,
      "name": "Reference Category",
    },
    {
      "icon": Icons.supervisor_account,
      "name": "Accounts",
    },
    {
      "icon": Icons.casino,
      "name": "Expense",
    },
  ];

  onSelectItem(String title) {
    setState(() {
      this._title = title;
    });
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
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          // backgroundColor: Color(0xFF2247CA),
          /* leading: IconButton(
            icon: Icon(FontAwesomeIcons.bars,
              color: Colors.white,
            ),
            onPressed: (){

            },
          ),*/
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
              margin: EdgeInsets.zero,
              accountEmail: Text("naw.andit@gmail.com"),
              accountName: Text("Nafee Walee"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile_pic.png"),
                ),
                onTap: () => print("This is your current account."),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/default_profile_picture2.jpg"),
                    ),
                    onTap: () {
                      print("This is your other account.");
                    }),
              ],
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/default_profile_banner.png"),
                      fit: BoxFit.fill)),
            ),

            ListView.builder(
              padding: new EdgeInsets.all(0.0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (BuildContext context, int index) {
                Map item = drawerItems[index];
                return WidgetListAnimator(
                  ListTile(
                    leading: Icon(
                      item['icon'],
                      color: _page == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.title.color,
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(
                        color: _page == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).textTheme.title.color,
                      ),
                    ),
                    onTap: () {
                      _pageController.jumpToPage(index);
                      onSelectItem(item['name']);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Dashboard(),
          Emergency(),
          Admission(),
          Operation(),
          Beds(),
          Services(),
          DoctorsDepartment(),
          Patient(),
          Reports(),
          ReferralCategory(),
          Accounts(),
          Expense(),
          //Page2(),
        ],
      ),
    );
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
            FlatButton(
              child: new Text("Stay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
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
          ],
        );
      },
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}

class Constants {
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[Settings, SignOut];
}

