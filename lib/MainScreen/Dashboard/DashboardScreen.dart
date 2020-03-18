import 'package:flutter/material.dart';
import 'package:flutterhms/MainScreen/Dashboard/AdmissionHistoryBarChart.dart';
import 'package:flutterhms/MainScreen/Dashboard/DataTable.dart';
import 'package:flutterhms/MainScreen/Dashboard/ExpansionTIleTests.dart';
import 'package:flutterhms/MainScreen/Dashboard/NextScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutterhms/MainScreen/Dashboard/PieChart.dart';
import 'FadeIn.dart';
import '../../SplashScreen/Typo.dart';



class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String _title = 'Home';
  int _page = 0;
  PageController _pageController;

  @override
  void initState(){
    _pageController =  new PageController(
      initialPage: _page,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.grey,
        height: 50,
        index: _page,
        //index: 0,
        items: <Widget>[
          Icon(Icons.dashboard, size: 30, color: Colors.white),
          Icon(Icons.pie_chart, size: 30,color: Colors.white),
          Icon(Icons.multiline_chart, size: 30,color: Colors.white),
          Icon(Icons.table_chart, size: 30,color: Colors.white),
          Icon(Icons.show_chart, size: 30,color: Colors.white),
        ],
        onTap: (index){
          this._pageController.animateToPage(index,duration: Duration(milliseconds: 10),curve: Curves.fastLinearToSlowEaseIn);
        },
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
            switchTitle(this._page);

          });
        },
        children: <Widget>[
          Container(
            child: AdmissionBarChart(),
          ),
          Container(
            child: PieOutsideLabelChart.withSampleData(),
          ),
          Container(
            child: BarChartSample2() ,
          ),
          Container(
            child: BillsTable(),
          ),
          Container(
            child: ExpansionTileTest(),
          ),
        ],
      ),
    );
  }


  void switchTitle(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            _title = 'Home';
          }
          break;
        case 1:
          {
            _title = 'Overview';
          }
          break;
        case 2:
          {
            _title = 'Something';
          }
          break;
        case 3:
          {
            _title = 'Clients';

          }
          break;
        case 4:
          {
            _title = 'Exit';
          }
          break;
      }
    });
    debugPrint("state $index");
  }

}

