import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterhms/SplashScreen/SplashScreen.dart';

void main() => runApp(InitApplication());

class InitApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   /* SystemChrome.setEnabledSystemUIOverlays([]);*/
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
