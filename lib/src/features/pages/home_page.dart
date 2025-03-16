import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongsathorn_port_app/src/features/core_page.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/app_bar.dart';
import 'package:pongsathorn_port_app/src/styles/colors.dart';
import 'package:pongsathorn_port_app/src/styles/hover_text.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isMenuVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    bool isMobile = width < 1440;

    if (!isMobile && _isMenuVisible) {
      setState(() {
        _isMenuVisible = false;
      });
    }

    return CorePage(
      label: "Home",
      child: (isMobile)
          ? _contentMobileSize(mbHeight: height, mbWidth: width)
          : _contentDesktopSize(dtHeight: height, dtWidth: width),
    );
  }

  Widget profileImage({double? fixedSized}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile.jpg',
          width: fixedSized ?? 300,
          height: fixedSized ?? 300,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.person,
            size: fixedSized ?? 300,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget desciptionProfile(
    double width,
    double height, {
    double regularSize = 20,
    double topicSize = 40,
    double titleSize = 70,
  }) {
    String greetingStr = "Hi, I'm Fuang.";
    String roleStr = "Full Stack developer";

    String desciptionStr = 'I’m Junior Full Stack Developer.\n\n'
        'My objective is to develop a system that streamlines work processes \nand provides a comprehensive range of functionalities.\n\n'
        'From a one-year enlisted soldier aspiring to enhance skills \nand improve quality of life.';

    String desciptionStr2 =
        '''I’m Junior Full Stack Developer.                                                                    \n
My objective is to develop a system that streamlines work processes and provides a comprehensive range of functionalities.       \n
From a one-year enlisted soldier aspiring to enhance skills \nand improve quality of life.''';

    bool isMobile = width < 700;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, height * 5 / 100, 0, 0),
      child: Column(
        children: [
          Text(
            greetingStr,
            style: GoogleFonts.kalam(
              color: MyColors.white,
              fontSize: titleSize,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            roleStr,
            style: GoogleFonts.kalam(
              color: MyColors.darkPink,
              fontSize: topicSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: isMobile ? width * 70 / 100 : null,
            padding: EdgeInsets.fromLTRB(
              width * 5 / 100,
              40,
              0,
              0,
            ),
            child: Text(
              isMobile ? desciptionStr2 : desciptionStr,
              style: GoogleFonts.robotoMono(
                color: MyColors.white,
                fontSize: regularSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          downloadCV(width, height),
        ],
      ),
    );
  }

  Widget downloadCV(double width, double height) {
    Color hoverColor = MyColors.lightPink;

    final Uri url = Uri.parse(
        'https://www.canva.com/design/DAGM5S6rgOg/q3Qbq7AH-mV73ssgS0O8Mg/view?utm_content=DAGM5S6rgOg&utm_campaign=designshare&utm_medium=link&utm_source=editor');

    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 10 / 100, 0, height * 2 / 100),
      color: MyColors.lightNavy,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: hoverColor,
          child: HoverRobotoMonoText(
            label: "Download CV",
            fontSize: 20,
            hoverColor: MyColors.white,
            textColor: MyColors.lightPink,
          ),
          onTap: () async {
            await launchUrl(url);
          },
        ),
      ),
    );
  }

  Widget _contentDesktopSize(
      {required double dtHeight, required double dtWidth}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(dtWidth * 20 / 100, 100, 0, 0),
                    child: profileImage(),
                  ),
                  desciptionProfile(dtWidth, dtHeight),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, dtHeight * 25 / 100, 0, 0),
                child: footerCredit(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contentMobileSize({
    required double mbHeight,
    required double mbWidth,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
              profileImage(fixedSized: 200),
              desciptionProfile(
                mbWidth,
                mbHeight,
                regularSize: 15,
                topicSize: 30,
                titleSize: 50,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, mbHeight * 10 / 100, 0, mbHeight * 2 / 100),
                child: footerCredit(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
