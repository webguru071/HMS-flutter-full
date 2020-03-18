import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Box extends StatelessWidget {
  static final boxDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 80.0),
      builder: (context, height) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 1200),
          delay: Duration(milliseconds: 500),
          tween: Tween(begin: 2.0, end: 300.0),
          builder: (context, width) {
            return Container(
              width: width,
              height: height,
              child: isEnoughRoomForTypewriter(width) ? TypewriterText("Hospital MS") : Container(),
            );
          },
        );
      },
    );
  }

  isEnoughRoomForTypewriter(width) => width > 20;
}

class TypewriterText extends StatelessWidget {
  static const TEXT_STYLE =
  TextStyle(letterSpacing: 5, fontSize: 25, fontWeight: FontWeight.w300, color: Colors.white);

  final String text;
  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
        duration: Duration(milliseconds: 600),
        delay: Duration(milliseconds: 300),
        tween: IntTween(begin: 0, end: text.length),
        builder: (context, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength), style: TEXT_STYLE),
              ControlledAnimation(
                playback: Playback.LOOP,
                duration: Duration(milliseconds: 600),
                tween: IntTween(begin: 0, end: 1),
                builder: (context, oneOrZero) {
                  return Opacity(
                      opacity: oneOrZero == 1 ? 1.0 : 0.0,
                      child: Text("_", style: TEXT_STYLE));
                },
              )
            ],
          );
        });
  }
}