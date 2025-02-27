import 'package:flutter/material.dart';

class Styles {
  static textStyle({
    Color color= Colors.black,
    FontWeight fontWeight= FontWeight.normal,
    double fontSize= 15.0,
    TextDecoration? textDecoration= TextDecoration.none,
    double? letterSpacing,
    String? fontFamily,
    var shadows,
    FontStyle? fontStyle,
    double height= 1.5,
    Paint? foreGround,
  }) {
    return TextStyle(
        height: height,
        color: foreGround != null ? null : color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        shadows: shadows,
        fontStyle: fontStyle,
        foreground: foreGround
    );
  }
}