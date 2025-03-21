import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/features/core_page.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/animate_widget.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/appbar_widget.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/button_widget.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';

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
            blurRadius: 20,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.black,
            blurRadius: 50,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: MyColors.darkNavy,
            blurRadius: 100,
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
    String roleStr = "Full Stack developer  ";

    String desciptionStr = 'I’m Junior Full Stack Developer.\n\n'
        'My objective is to develop a system that streamlines work processes \nand provides a comprehensive range of functionalities.\n\n'
        'After completing military service, I am committed to enhancing my skills \nand improving my quality of life.';

    String desciptionStr2 =
        '''I’m Junior Full Stack Developer.                                                                    \n
My objective is to develop a system that streamlines work processes \nand provides a comprehensive range of functionalities.       \n
After completing military service, I am committed to enhancing my skills and improving my quality of life.''';

    bool isMobile = width < 700;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, height * 5 / 100, 0, 0),
      child: Column(
        children: [
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  greetingStr,
                  textStyle: kalam.copyWith(
                    color: MyColors.white,
                    fontSize: titleSize,
                    fontWeight: FontWeight.w900,
                  ),
                  cursor: '|',
                  speed: Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 3,
              pause: Duration(milliseconds: 1500),
            ),
          ),
          AnimateSlideWidget(
            child: Text(
              roleStr,
              style: kalam.copyWith(
                color: MyColors.darkPink,
                fontSize: topicSize,
                fontWeight: FontWeight.w600,
              ),
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
              style: robotoMono.copyWith(
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

  Widget _contentDesktopSize(
      {required double dtHeight, required double dtWidth}) {
    return Padding(
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
            padding: EdgeInsets.fromLTRB(0, dtHeight * 15 / 100, 0, 0),
            child: socialIconRow(),
          ),
          footerCredit(),
        ],
      ),
    );
  }

  Widget _contentMobileSize({
    required double mbHeight,
    required double mbWidth,
  }) {
    return Padding(
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
            padding: EdgeInsets.fromLTRB(0, mbHeight * 10 / 100, 0, 0),
            child: socialIconRow(),
          ),
          footerCredit(),
        ],
      ),
    );
  }
}
