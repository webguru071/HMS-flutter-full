import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterhms/MainScreen/MainScreen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  TextEditingController email=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  bool _validate = false;

  String msg='';
  String username='';
  bool _rememberMe = false;
  Animation<double> _iconAnimation,_iconAnimation2;
  AnimationController _iconAnimationController,_iconAnimationController2;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimationController2 = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeInSine,);
    _iconAnimation2 = new CurvedAnimation(parent: _iconAnimationController2, curve: Curves.linear,);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimation2.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    _iconAnimationController2.forward();
  }
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }
  Future<List> _login() async {
    final response = await http.post("https://nafeewalee.000webhostapp.com/flutter_connection/login.php", body: {
      "email": email.text,
      "password": pass.text,},
    );

    var datauser = json.decode(response.body);


    //print("data: $datauser");
    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
      setState(() {
        username= datauser[0]['name'];
      });

      if(datauser[0]['name']=='Admin'){

        msg="";
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (c, a1, a2) => MainScreen(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 600)));
      }else if(datauser[0]['name']=='Pharmacy') {
        msg = "";
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (c, a1, a2) => MainScreen(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 600)));
      }
      print(username);
    }

    return datauser;
  }
  void _staticLogin(){
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (c, a1, a2) => MainScreen(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 600)));
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height:  _iconAnimation.value * 60.0,
          child: TextField(
            controller: email,

            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              // errorText: _validate ? 'Value Can\'t Be Empty' : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height:  _iconAnimation.value * 60.0,
          child: TextField(
            controller: pass,
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              //: _validate ? 'Value Can\'t Be Empty' : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      height: _iconAnimation2.value * 20.0,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: _iconAnimation2.value * 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _iconAnimation.value * 60.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 25.0,
        onPressed: () {
          _staticLogin();
          if(email.text.isEmpty || pass.text.isEmpty){
            _validate = false;
          }
          else{
            _validate = true;
            print(_validate);
            //_login();
          }

          //_login();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF2247CA),
                      Color(0xFF3062D5),
                      Color(0xFF3982DD),
                      Color(0xFF449CE6),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ), //Background color
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 100.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: _iconAnimation2.value * 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              ), //full body
            ],
          ),
        ),
      ),
    );
  }
}

final kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);


