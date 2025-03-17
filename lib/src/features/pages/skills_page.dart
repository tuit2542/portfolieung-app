import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongsathorn_port_app/src/features/core_page.dart';
import 'package:pongsathorn_port_app/src/shared/utils/function.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/appbar_widget.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/card_widget.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<Map<String, dynamic>>? techList;

  List<Map<String, dynamic>>? toolList;

  bool _isLoading = false;

  @override
  void initState() {
    readJson();
    super.initState();
  }

  void setLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void unsetLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> readJson() async {
    setLoading();
    await Future.delayed(const Duration(milliseconds: 1500));
    final String response =
        await rootBundle.loadString('assets/json/techstack.json');
    final data = await json.decode(response);
    techList = castToMapStringDynamic(data['techList']);
    toolList = castToMapStringDynamic(data['toolList']);
    unsetLoading();
  }

  List<String> laguageList = [
    "Thai [ NATIVE ]",
    "English [ GOOD ]",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    bool isMobile = width < 1440 ? true : false;

    return CorePage(
      label: "Skills",
      isLoading: _isLoading,
      child: isMobile
          ? _contentMobileSize(mbWidth: width, mbHeight: height)
          : _contentDestopSize(dtWidth: width, dtHeight: height),
    );
  }

  Widget _contentMobileSize({required mbWidth, required double mbHeight}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Tech Stack",
            style: GoogleFonts.kalam(
              fontSize: 40,
              color: MyColors.lightPink,
            ),
          ),
        ),
        _boxList(
          width: mbWidth,
          height: mbHeight,
          list: techList,
          iconSize: 40,
          boxSize: 90,
          fontSize: 10,
          mutiplier: 0.8,
        ),
        lineBreak(width: mbWidth),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Tools",
            softWrap: true,
            style: GoogleFonts.kalam(
              fontSize: 40,
              color: MyColors.lightPink,
            ),
          ),
        ),
        _boxList(
          width: mbWidth,
          height: mbHeight,
          list: toolList,
          iconSize: 40,
          boxSize: 90,
          fontSize: 10,
          mutiplier: 0.8,
        ),
        lineBreak(width: mbWidth),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Languages",
            softWrap: true,
            style: GoogleFonts.kalam(
              fontSize: 40,
              color: MyColors.lightPink,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ...laguageList.map(
                (language) => Text(
                  language,
                  style: GoogleFonts.robotoMono(
                    fontSize: 15,
                    color: MyColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
              0, mbHeight * 20 / 100, 0, mbHeight * 2 / 100),
          child: footerCredit(),
        ),
      ],
    );
  }

  Widget _contentDestopSize({
    required dtWidth,
    required double dtHeight,
    double multiplier = 1,
  }) {
    return Column(
      children: [
        Text(
          "Tech Stack",
          style: GoogleFonts.kalam(
            fontSize: 50,
            color: MyColors.lightPink,
          ),
        ),
        _boxList(
          width: dtWidth,
          height: dtHeight,
          list: techList,
          mutiplier: multiplier,
        ),
        lineBreak(width: dtWidth),
        Text(
          "Tools",
          style: GoogleFonts.kalam(
            fontSize: 50,
            color: MyColors.lightPink,
          ),
        ),
        _boxList(
          width: dtWidth,
          height: dtHeight,
          list: toolList,
          mutiplier: multiplier,
        ),
        lineBreak(width: dtWidth),
        Text(
          "Languages",
          softWrap: true,
          style: GoogleFonts.kalam(
            fontSize: 50,
            color: MyColors.lightPink,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ...laguageList.map(
                (language) => Text(
                  language,
                  style: GoogleFonts.robotoMono(
                    fontSize: 15,
                    color: MyColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
              0, dtHeight * 20 / 100, 0, dtHeight * 2 / 100),
          child: footerCredit(),
        )
      ],
    );
  }

  Widget _boxList({
    required double width,
    required double height,
    double iconSize = 60,
    double fontSize = 14,
    double boxSize = 120,
    double mutiplier = 1,
    List<Map<String, dynamic>>? list,
  }) {
    return _animatedContainer(
      height: height,
      width: width,
      multiplier: mutiplier,
      child: Wrap(
        runAlignment: WrapAlignment.start,
        spacing: 10, // Horizontal space between items
        runSpacing: 10, // Vertical space between items
        children: List.generate(
          list?.length ?? 10,
          (index) => ContainerCard(
            iconSize: iconSize,
            fontSize: fontSize,
            boxSize: boxSize,
            isLoading: _isLoading,
            logoStr: list?[index].keys.first ?? "",
            label: list?[index].values.first ?? "",
          ),
        ),
      ),
    );
  }

  Widget _animatedContainer({
    required double width,
    required double height,
    required Widget child,
    // int milliseconds = 1500,
    double multiplier = 1,
  }) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        // duration: Duration(milliseconds: milliseconds),
        // curve: Curves.easeInOut,
        width: width * multiplier,
        child: Center(child: child),
      );
    });
  }
}
