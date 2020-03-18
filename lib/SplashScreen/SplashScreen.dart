import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhms/LoginScreen/LoginScreen.dart';
import 'package:flutterhms/SplashScreen/Typo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController animation, animation2;
  Animation<double> _fadeInFadeOut;
  Animation<double> _fadeIn;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (c, a1, a2) => LoginScreen(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 700)));
    animation.dispose();
    animation2.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTime();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    animation2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    _fadeIn = Tween<double>(begin: 0.0, end: 1).animate(animation2);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
    animation2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                ],
                stops: [0.1, 0.3, 0.7, 0.9],
              ),
            ),
          ),
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeTransition(
                    opacity: _fadeInFadeOut,
                    child: Container(
                      child: Image.asset('assets/images/pharma_icon31.gif',height: 200.00,width: 200.00,),
                    ),
                  ),
                  FadeTransition(
                    opacity: _fadeIn,
                    child: Box(),
                  )
                ],
              )
          )//Background color Center(
        ]));
  }
}
