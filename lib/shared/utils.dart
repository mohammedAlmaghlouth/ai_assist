import 'package:flutter/material.dart';

TextStyle textStyle({double? size, Color? color, FontWeight? fw}) {
  return TextStyle(
    fontFamily: "Cera Pro",
    fontSize: size ?? 14,
    color: color ?? Colors.white, // Use a default color
    fontWeight: fw ?? FontWeight.normal, // Use a default font weight
  );
}
