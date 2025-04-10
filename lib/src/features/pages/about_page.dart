// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pongsathorn_port_app/src/features/core_page.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/animate_widget.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/appbar_widget.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String personalData = '''Name : Pongsathorn Boondee
Nickname : Fuang
Date of Birth : 04/05/1999
''';

  String desciptionData =
      '''I’m a Junior Full Stack Developer, Having recently completed military service, 
                        
I am currently seeking opportunities in the field of software engineering or development. 
                        
With one year of experience as a Full-Stack Developer and four-month internship as a Software Engineer, 
                        
I am eager hance my skills and contribute to a dynamic team.
                        ''';

  String collegeName =
      '''King Mongkut's University of Technology North Bangkok''';
  String majorName =
      '''Bachelor of Engineering Program in Electronics Engineering Technology ( Computer )''';

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    bool isMobile = width < 900;

    return CorePage(
      controller: _scrollController,
      label: "About",
      child: (isMobile)
          ? AnimateSlideWidget(
              child: _contentMobileSize(height: height, width: width))
          : AnimateSlideWidget(
              fxList: [],
              child: _contentDesktopSize(height: height, width: width)),
    );
  }

  Widget _contentDesktopSize({required double height, required double width}) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 5 / 100,
                      0,
                      width * 5 / 100,
                      0,
                    ),
                    child: Text(
                      "About Me",
                      style: kalam.copyWith(
                        fontSize: 50,
                        color: MyColors.lightPink,
                      ),
                    ),
                  ).animate(delay: 1000.ms),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 5 / 100,
                      0,
                      width * 5 / 100,
                      0,
                    ),
                    child: Text(
                      personalData,
                      style: robotoMono.copyWith(
                        fontSize: 24,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * 5 / 100, 0, width * 5 / 100, 0),
                    child: Text(
                      desciptionData,
                      softWrap: true,
                      style: robotoMono.copyWith(
                          fontSize: 20,
                          color: MyColors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 5 / 100,
                      0,
                      width * 5 / 100,
                      0,
                    ),
                    child: Text(
                      "Education",
                      style: kalam.copyWith(
                        fontSize: 50,
                        color: MyColors.lightPink,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 5 / 100,
                      0,
                      0,
                      0,
                    ),
                    child: Text(
                      collegeName,
                      style: robotoMono.copyWith(
                        fontSize: 40,
                        color: MyColors.darkPink,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 5 / 100,
                      10,
                      0,
                      0,
                    ),
                    child: Text(
                      majorName,
                      style: robotoMono.copyWith(
                        fontSize: 24,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(width * 5 / 100, 10, 0, 0),
                        child: Text(
                          "GPAX 3.02",
                          style: robotoMono.copyWith(
                            fontSize: 24,
                            color: MyColors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, width * 5 / 100, 0),
                        child: Text(
                          "2019 - 2022",
                          style: robotoMono.copyWith(
                            fontSize: 24,
                            color: MyColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 15 / 100,
                  ),
                  footerCredit(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _contentMobileSize({required double height, required double width}) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "About Me",
                style: kalam.copyWith(
                  fontSize: 40,
                  color: MyColors.lightPink,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                personalData,
                style: robotoMono.copyWith(
                  fontSize: 15,
                  color: MyColors.white,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(width * 5 / 100, 0, width * 5 / 100, 0),
              child: Text(
                desciptionData,
                softWrap: true,
                style: robotoMono.copyWith(
                  fontSize: 15,
                  color: MyColors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Education",
                softWrap: true,
                style: kalam.copyWith(
                  fontSize: 40,
                  color: MyColors.lightPink,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 5 / 100, 0, 0, 0),
              child: Text(
                collegeName,
                style: robotoMono.copyWith(
                  fontSize: 20,
                  color: MyColors.darkPink,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 5 / 100, 10, 0, 0),
              child: Text(
                majorName,
                style: robotoMono.copyWith(
                  fontSize: 15,
                  color: MyColors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 5 / 100,
                    15,
                    0,
                    0,
                  ),
                  child: Text(
                    "GPAX 3.02",
                    style: robotoMono.copyWith(
                        fontSize: 15,
                        color: MyColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    15,
                    width * 50 / 1000,
                    0,
                  ),
                  child: Text(
                    "2019 - 2022",
                    style: robotoMono.copyWith(
                        fontSize: 15,
                        color: MyColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 22 / 100,
            ),
            footerCredit(),
          ],
        ),
      ],
    );
  }
}
