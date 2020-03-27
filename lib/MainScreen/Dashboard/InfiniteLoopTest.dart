import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhms/LoginScreen/LoginScreen.dart';
import 'package:flutterhms/MainScreen/Admission/Admission.dart';
import 'package:flutterhms/MainScreen/Emergency/Emergency.dart';
import 'package:flutterhms/SplashScreen/Typo.dart';

import 'DashboardScreen.dart';

class ExpansionTileTest extends StatefulWidget {
  @override
  _ExpansionTileTestState createState() => _ExpansionTileTestState();

}

class _ExpansionTileTestState extends State<ExpansionTileTest> {
  final GlobalKey<AppExpansionTileState> expansionTile1 = new GlobalKey();
  final GlobalKey<AppExpansionTileState> expansionTile2 = new GlobalKey();
  final GlobalKey<AppExpansionTileState> expansionTile3 = new GlobalKey();



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
              AppExpansionTile(
                key: expansionTile1,
                onExpansionChanged: ((newState) {
                  if (newState)
                    setState(() {
                      expansionTile2.currentState.collapse();
                      expansionTile3.currentState.collapse();
                    });
                }),
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
              AppExpansionTile(
                key: expansionTile2,
                onExpansionChanged: ((newState) {
                  if (newState)
                    setState(() {
                      expansionTile1.currentState.collapse();
                      expansionTile3.currentState.collapse();
                    });
                }),
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
                    title: Text('Discharge List'),
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
              AppExpansionTile(
                key: expansionTile3,
                onExpansionChanged: ((newState) {
                  if (newState)
                    setState(() {
                      expansionTile1.currentState.collapse();
                      expansionTile2.currentState.collapse();
                    });
                }),
                leading: Icon(Icons.phone_iphone),
                title: Text("Beds"),
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Bed Types'),
                    selected: 3 == selectedDrawerNavigableChild,
                    onTap: () => onSelectItem(1, 'Report'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Beds'),
                    selected: 3 == selectedDrawerNavigableChild,
                    onTap: () => onSelectItem(1, 'Report'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Bed Map'),
                    selected: 3 == selectedDrawerNavigableChild,
                    onTap: () => onSelectItem(1, 'Report'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 72.0),
                    title: Text('Bed Charge'),
                    selected: 3 == selectedDrawerNavigableChild,
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



// --- Copied and slightly modified version of the ExpansionTile.
const Duration _kExpand = const Duration(milliseconds: 200);

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    Key key,
    this.leading,
    @required this.title,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children: const <Widget>[],
    this.trailing,
    this.initiallyExpanded: false,
  })
      : assert(initiallyExpanded != null),
        super(key: key);

  final Widget leading;
  final Widget title;
  final ValueChanged<bool> onExpansionChanged;
  final List<Widget> children;
  final Color backgroundColor;
  final Widget trailing;
  final bool initiallyExpanded;

  @override
  AppExpansionTileState createState() => new AppExpansionTileState();
}

class AppExpansionTileState extends State<AppExpansionTile> with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _easeOutAnimation;
  CurvedAnimation _easeInAnimation;
  ColorTween _borderColor;
  ColorTween _headerColor;
  ColorTween _iconColor;
  ColorTween _backgroundColor;
  Animation<double> _iconTurns;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(duration: _kExpand, vsync: this);
    _easeOutAnimation = new CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _easeInAnimation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = new ColorTween();
    _headerColor = new ColorTween();
    _iconColor = new ColorTween();
    _iconTurns = new Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation);
    _backgroundColor = new ColorTween();

    _isExpanded = PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded)
      _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    _setExpanded(true);
  }

  void collapse() {
    _setExpanded(false);
  }

  void toggle() {
    _setExpanded(!_isExpanded);
  }

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded)
          _controller.forward();
        else
          _controller.reverse().then<void>(( value ) async {
            setState(() {

            });
          });
        PageStorage.of(context)?.writeState(context, _isExpanded);
      });
      if (widget.onExpansionChanged != null) {
        widget.onExpansionChanged(_isExpanded);
      }
    }
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    final Color borderSideColor = _borderColor.evaluate(_easeOutAnimation) ?? Colors.transparent;
    final Color titleColor = _headerColor.evaluate(_easeInAnimation);

    return new Container(
      decoration: new BoxDecoration(
          color: _backgroundColor.evaluate(_easeOutAnimation) ?? Colors.transparent,
          border: new Border(
            top: new BorderSide(color: borderSideColor),
            bottom: new BorderSide(color: borderSideColor),
          )
      ),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme.merge(
            data: new IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
            child: new ListTile(
              onTap: toggle,
              leading: widget.leading,
              title: new DefaultTextStyle(
                style: Theme
                    .of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: titleColor),
                child: widget.title,
              ),
              trailing: widget.trailing ?? new RotationTransition(
                turns: _iconTurns,
                child: const Icon(Icons.expand_more),
              ),
            ),
          ),
          new ClipRect(
            child: new Align(
              heightFactor: _easeInAnimation.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.subhead.color
      ..end = theme.accentColor;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColor.end = widget.backgroundColor;

    final bool closed = !_isExpanded && _controller.isDismissed;
    return new AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : new Column(children: widget.children),
    );
  }
}
