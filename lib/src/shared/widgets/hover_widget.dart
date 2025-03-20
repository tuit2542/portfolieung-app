import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';

class HoverKalamText extends StatefulWidget {
  String label;
  bool underline;
  double fontSize;
  Color? hoverColor;
  Color? textColor;

  HoverKalamText({
    super.key,
    required this.label,
    this.underline = false,
    this.fontSize = 30,
    this.textColor = MyColors.white,
    this.hoverColor,
  });

  @override
  State<HoverKalamText> createState() => _HoverKalamTextState();
}

class _HoverKalamTextState extends State<HoverKalamText> {
  Color? _textColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _textColor = widget.hoverColor ?? MyColors.lightPink;
      }),
      onExit: (_) => setState(() {
        _textColor = widget.textColor ?? MyColors.white;
      }),
      child: Text(
        widget.label,
        style: kalam.copyWith(
          color: widget.underline
              ? widget.hoverColor ?? MyColors.lightPink
              : _textColor ?? widget.textColor,
          fontSize: widget.fontSize,
        ).copyWith(
          decoration: widget.underline ? TextDecoration.underline : null,
          decorationColor: MyColors.lightPink,
          decorationThickness: 3,
        ),
      ),
    );
  }
}


class HoverRobotoMonoText extends StatefulWidget {
  String label;
  bool underline;
  double fontSize;
  Color? hoverColor;
  Color? textColor;

  HoverRobotoMonoText({
    super.key,
    required this.label,
    this.underline = false,
    this.fontSize = 30,
    this.textColor = MyColors.white,
    this.hoverColor,
  });

  @override
  State<HoverRobotoMonoText> createState() => _HoverRobotoMonoTextState();
}

class _HoverRobotoMonoTextState extends State<HoverRobotoMonoText> {
  Color? _textColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _textColor = widget.hoverColor ?? MyColors.lightPink;
      }),
      onExit: (_) => setState(() {
        _textColor = widget.textColor ?? MyColors.white;
      }),
      child: Text(
        widget.label,
        style: robotoMono.copyWith(
          color: widget.underline
              ? widget.hoverColor ?? MyColors.lightPink
              : _textColor ?? widget.textColor,
          fontSize: widget.fontSize,
        ).copyWith(
          decoration: widget.underline ? TextDecoration.underline : null,
          decorationColor: MyColors.lightPink,
          decorationThickness: 3,
        ),
      ),
    );
  }
}