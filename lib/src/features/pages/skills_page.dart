import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongsathorn_port_app/src/shared/app_bar.dart';
import 'package:pongsathorn_port_app/src/styles/colors.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<String> techList = [
    'Dart',
    'Flutter',
    'GraphQL',
    'REST',
    'TypeScript',
    'Angular',
    'ReactJS',
    'PHP',
    'Laravel',
    'Java',
    'Springboot',
    'SQL (MySQL)',
    'NoSQL (Firebase)',
  ];

  List<String> toolList = [
    'Visual Studio Code',
    'IntelliJ IDEA',
    'PHP MyAdmin',
    'MySQL Workbench',
    'CA API',
    'Swagger',
    'Postman',
    'Mountebank',
    'Jira',
    'Confluence',
    'Jenkins',
  ];

  List<String> laguageList = [
    "Thai [ NATIVE ]",
    "English [ GOOD ]",
  ];

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
        isMenu: isMenu,
        onTap: () {
          context.go("/About");
        },
      ),
      navButton(
        "Skills",
        width,
        underline: true,
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

  bool _isMenuVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

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
            ? _contentMobileSize(mbWidth: width, mbHeight: height)
            : _contentDestopSize(dtWidth: width, dtHeight: height),
      ),
    );
  }

  Widget _contentMobileSize({required mbWidth, required double mbHeight}) {
    return Column(
      children: [
        if (_isMenuVisible)
          appBarMenu(
            mbWidth,
            appBarChildren(mbWidth, isMenu: true),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Tech Stack",
                  style: GoogleFonts.kalam(
                    fontSize: 50,
                    color: MyColors.lightPink,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ...techList.map(
                      (tech) => Text(
                        tech,
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              lineBreak(width: mbWidth),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Tools",
                  softWrap: true,
                  style: GoogleFonts.kalam(
                    fontSize: 50,
                    color: MyColors.lightPink,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ...toolList.map(
                      (tool) => Text(
                        tool,
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              lineBreak(width: mbWidth),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Languages",
                  softWrap: true,
                  style: GoogleFonts.kalam(
                    fontSize: 50,
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
          ),
        ),
      ],
    );
  }

  Widget _contentDestopSize({required dtWidth, required double dtHeight}) {
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
                        dtWidth * 5 / 100,
                        0,
                        dtWidth * 5 / 100,
                        0,
                      ),
                      child: Text(
                        "Tech Stack",
                        style: GoogleFonts.kalam(
                          fontSize: 70,
                          color: MyColors.lightPink,
                        ),
                      ),
                    ),
                    ...techList.map(
                      (tech) => Text(
                        tech,
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        dtWidth * 5 / 100,
                        0,
                        dtWidth * 5 / 100,
                        0,
                      ),
                      child: Text(
                        "Tools",
                        style: GoogleFonts.kalam(
                          fontSize: 70,
                          color: MyColors.lightPink,
                        ),
                      ),
                    ),
                    ...toolList.map(
                      (tool) => Text(
                        tool,
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0, dtHeight * 20 / 100, 0, dtHeight * 2 / 100),
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
}
