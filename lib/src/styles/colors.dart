import 'package:flutter/material.dart';

class MyColors {
  static const Color darkPink = Color(0xFFE337B8);
  static const Color lightPink = Color(0xFFFFB1B1);
  static const Color darkNavy = Color(0xFF102C57);
  static const Color lightNavy = Color(0xFF006192);
  static const Color white = Color(0xFFFFFFFF);
}

Widget lineBreak({Color? color, required double width}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
    child: Align(
      alignment: Alignment.center,
      child: Container(
        height: 3,
        width: width * 70 / 100,
        decoration: BoxDecoration(
          color: color ?? MyColors.lightNavy,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );
}
