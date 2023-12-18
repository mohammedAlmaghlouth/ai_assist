import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color ?? Colors.white, // Use a default color
    fontWeight: fw ?? FontWeight.normal, // Use a default font weight
  );
}
