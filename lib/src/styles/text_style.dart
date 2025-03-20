import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';

TextStyle kalam = TextStyle(
  fontSize: 16,
  color: MyColors.white,
  fontFamily: 'Kalam',
);
TextStyle robotoMono = TextStyle(
  fontSize: 16,
  color: MyColors.white,
  fontFamily: 'RobotoMono',
);
TextStyle sarabun = TextStyle(
  fontSize: 16,
  color: MyColors.white,
  fontFamily: 'Sarabun',
);
BorderRadius textFieldRadius = BorderRadius.circular(10);

final textFormFieldDecorate = InputDecoration(
  // suffixIcon: Tooltip(
  //   message: "This is a tooltip",
  //   child: Container(
  //     margin: EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(100),
  //       color: MyColors.lightNavy,
  //     ),
  //     child: Icon(
  //       Icons.question_mark_sharp,
  //       color: MyColors.lightPink,
  //       size: 15,
  //     ),
  //   ),
  // ),
  hintFadeDuration: Duration(milliseconds: 500),
  enabledBorder: OutlineInputBorder(
    borderRadius: textFieldRadius,
    borderSide: const BorderSide(
      color: MyColors.lightNavy,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: textFieldRadius,
    borderSide: const BorderSide(
      color: MyColors.lightPink,
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: textFieldRadius,
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: textFieldRadius,
    borderSide: const BorderSide(
      color: Colors.red,
      width: 2,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: textFieldRadius,
    borderSide: BorderSide(
      color: Colors.blueGrey[700]!,
      width: 1,
    ),
  ),
  hintStyle: robotoMono.copyWith(
      color: MyColors.lightNavy, fontWeight: FontWeight.bold),
  errorStyle: robotoMono.copyWith(
      color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
);
