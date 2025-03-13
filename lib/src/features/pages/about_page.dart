// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongsathorn_port_app/src/shared/app_bar.dart';
import 'package:pongsathorn_port_app/src/styles/colors.dart';

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

  bool _isMenuVisible = false;

  List<Widget> appBarChildren(double width, {bool isMenu = false}) {
    return [
      navButton(
        "Home",
        width,
        isMenu: isMenu,
        onTap: () {
          context.go("/Home");
        },
      ),
      navButton(
        "About",
        width,
        underline: true,
        isMenu: isMenu,
        onTap: () {
          context.go("/About");
        },
      ),
      navButton(
        "Skills",
        width,
        isMenu: isMenu,
        onTap: () {
          context.go("/Skills");
        },
      ),
      navButton(
        "Career",
        width,
        isMenu: isMenu,
        onTap: () {},
      ),
      navButton(
        "Contact",
        width,
        isMenu: isMenu,
        onTap: () {},
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: MyAppBar(
          width: width,
          children: appBarChildren(width),
          onTap: () {
            setState(() {
              _isMenuVisible = !_isMenuVisible;
            });
          }),
      backgroundColor: MyColors.darkNavy,
      body: SingleChildScrollView(
          child: width < 900
              ? _contentMobileSize(height: height, width: width)
              : _contentDesktopSize(height: height, width: width)),
    );
  }

  Widget _contentDesktopSize({required double height, required double width}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
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
                        "About",
                        style: GoogleFonts.kalam(
                          fontSize: 70,
                          color: MyColors.lightPink,
                        ),
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
                        personalData,
                        style: GoogleFonts.robotoMono(
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
                        style: GoogleFonts.robotoMono(
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
                        style: GoogleFonts.kalam(
                          fontSize: 70,
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
                        style: GoogleFonts.robotoMono(
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
                        style: GoogleFonts.robotoMono(
                          fontSize: 24,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(width * 5 / 100, 10, 0, 0),
                          child: Text(
                            "GPAX 3.02",
                            style: GoogleFonts.robotoMono(
                              fontSize: 24,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, 10, width * 5 / 100, 0),
                          child: Text(
                            "2019 - 2022",
                            style: GoogleFonts.robotoMono(
                              fontSize: 24,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0, height * 20 / 100, 0, height * 2 / 100),
                      child: footerCredit(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contentMobileSize({required double height, required double width}) {
    return Column(
      children: [
        if (_isMenuVisible)
          appBarMenu(
            width,
            appBarChildren(width, isMenu: true),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "About",
                  style: GoogleFonts.kalam(
                    fontSize: 50,
                    color: MyColors.lightPink,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  personalData,
                  style: GoogleFonts.robotoMono(
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
                  style: GoogleFonts.robotoMono(
                      fontSize: 15,
                      color: MyColors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Education",
                  softWrap: true,
                  style: GoogleFonts.kalam(
                    fontSize: 50,
                    color: MyColors.lightPink,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 5 / 100, 0, 0, 0),
                child: Text(
                  collegeName,
                  style: GoogleFonts.robotoMono(
                    fontSize: 20,
                    color: MyColors.darkPink,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 5 / 100, 10, 0, 0),
                child: Text(
                  majorName,
                  style: GoogleFonts.robotoMono(
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
                      style: GoogleFonts.robotoMono(
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
                      style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: MyColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  child: Text(
                    "Skills",
                    style: GoogleFonts.robotoMono(
                        color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {
                    context.push("/Skills");
                    // Navigator.pushNamed(context, "/Skills");
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, height * 20 / 100, 0, height * 2 / 100),
                child: footerCredit(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
