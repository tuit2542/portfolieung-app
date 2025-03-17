import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/features/core_page.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/appbar_widget.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/carousel_widget.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';

class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  Map<String, dynamic> scb = {
    'logo': 'assets/logos/career/logo_scb.png',
    'name': 'SCB – Siam Commercial Bank PCL',
    'position': 'Software Engineer',
    'date': 'JAN 2022 - APR 2022',
    'detail':
        '''• Developed the Mae Manee E-wallet gateway and coordinated with the product owner.\n( CA API, mountebank, Swagger )\n
• Develop new microservices for another team.\n( Java, Spring Boot )\n
• Handle issue requests, identify the cause, and provide advice to both internal and external parties.\n( Kibana, Log viewer )'''
  };

  Map<String, dynamic> bbtv = {
    'logo': 'assets/logos/career/logo_bbtv.png',
    'name': 'BBTV  New Media Co., Ltd.',
    'position': 'Junior Full Stack Developer',
    'date': 'AUG 2022 - JUL 2023',
    'detail':
        '''• Resolved customer issues related to Frontend Development in Jira.\n( Type Script, Angular, React )\n
• Created an internal pilot application.\n( Flutter, GraphQL, Figma )\n
• Update the tech stack for the existing project.\n( PHP, Laravel, MySQL )'''
  };

  Map<String, dynamic> marine = {
    'logo': 'assets/logos/career/logo_marine.png',
    'name':
        'Naval Special Warfare Command,\nRoyal Thai Fleet,\nRoyal Thai Navy',
    'position': 'Marine and Administrator',
    'date': 'AUG 2023 - JUL 2024',
    'detail':
        '''• Handled administrative tasks and data entry at RTN Recruit Training Center and Fleet Training Command.\n
• Served as a garrison guard, security personnel, traffic soldier, and gunner at the Naval Special Warfare Command.'''
  };

  List<String> scbImgList =
      List.generate(3, (index) => 'assets/images/career/scb${index + 1}.png');

  List<String> bbtvImgList =
      List.generate(3, (index) => 'assets/images/career/bbtv${index + 1}.png');

  List<String> marineImgList = List.generate(
      4, (index) => 'assets/images/career/marine${index + 1}.png');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = width < 1440 ? true : false;

    ScrollController scrollController = ScrollController();
    CarouselSliderController carouselController = CarouselSliderController();

    return CorePage(
      controller: scrollController,
      label: "Career",
      child: isMobile
          ? _mobileContent(width, height, carouselController)
          : _desktopContent(width, height, carouselController),
    );
  }

  Widget _mobileContent(double width, double height,
      CarouselSliderController carouselController) {
    return Column(
      children: [
        Text(
          "Internship",
          style: kalam.copyWith(fontSize: 40, color: MyColors.lightPink),
        ),
        careerDetail(text: scb, style: robotoMono, width: width),
        CarouselExample(
          controller: carouselController,
          imageList: scbImgList,
        ),
        lineBreak(width: width),
        SizedBox(height: 50),
        Text(
          "Work Experienced",
          style: kalam.copyWith(fontSize: 40, color: MyColors.lightPink),
        ),
        careerDetail(text: bbtv, style: robotoMono, width: width),
        CarouselExample(
          controller: carouselController,
          imageList: bbtvImgList,
        ),
        SizedBox(height: 50),
        lineBreak(width: width),
        careerDetail(text: marine, style: robotoMono, width: width),
        CarouselExample(
          controller: carouselController,
          imageList: marineImgList,
        ),
        lineBreak(width: width),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(10),
          child: footerCredit(),
        ),
      ],
    );
  }

  Widget _desktopContent(double width, double height,
      CarouselSliderController carouselController) {
    return Column(
      children: [
        Text(
          "Internship",
          style: kalam.copyWith(fontSize: 50, color: MyColors.lightPink),
        ),
        careerDetail(
            text: scb, style: robotoMono, width: width, isMobile: false),
        CarouselExample(
          controller: carouselController,
          imageList: scbImgList,
        ),
        lineBreak(width: width),
        SizedBox(height: 100),
        Text(
          "Work Experienced",
          style: kalam.copyWith(fontSize: 50, color: MyColors.lightPink),
        ),
        careerDetail(
            text: bbtv, style: robotoMono, width: width, isMobile: false),
        CarouselExample(
          controller: carouselController,
          imageList: bbtvImgList,
        ),
        SizedBox(height: 50),
        lineBreak(width: width),
        careerDetail(
            text: marine, style: robotoMono, width: width, isMobile: false),
        CarouselExample(
          controller: carouselController,
          imageList: marineImgList,
        ),
        lineBreak(width: width),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(10),
          child: footerCredit(),
        ),
      ],
    );
  }

  Widget careerDetail({
    required double width,
    required Map<String, dynamic> text,
    TextStyle? style,
    bool isMobile = true,
  }) {
    double paddingWidth = isMobile ? width * 0.025 : width * 0.10;
    double textPaddingWidth = width * 0.05;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          paddingWidth, 50, paddingWidth, isMobile ? 0 : 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(textPaddingWidth, 0, textPaddingWidth, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text['name'],
                  style: robotoMono.copyWith(
                    fontSize: isMobile ? 16 : 36,
                    color: MyColors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                (isMobile)
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(
                            right: isMobile ? 0 : width * 0.055),
                        child: ClipOval(
                          child: Image.asset(
                            text['logo'],
                            width: isMobile ? 40 : 60,
                            height: isMobile ? 40 : 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
              ],
            ),
          ),
          (isMobile)
              ? Padding(
                  padding: EdgeInsets.fromLTRB(
                      textPaddingWidth, 0, textPaddingWidth, 20),
                  child: Text(
                    text['position'],
                    style: robotoMono.copyWith(
                      fontSize: isMobile ? 14 : 32,
                      color: MyColors.darkPink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Container(),
          (isMobile)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          textPaddingWidth, 0, textPaddingWidth, 10),
                      child: Text(
                        text['date'],
                        style:
                            robotoMono.copyWith(fontSize: isMobile ? 14 : 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.055),
                      child: ClipOval(
                        child: Image.asset(
                          text['logo'],
                          width: isMobile ? 40 : 60,
                          height: isMobile ? 40 : 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          textPaddingWidth, 0, textPaddingWidth, 20),
                      child: Text(
                        text['position'],
                        style: robotoMono.copyWith(
                            fontSize: isMobile ? 14 : 32,
                            color: MyColors.darkPink,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          textPaddingWidth, 0, textPaddingWidth, 10),
                      child: Text(
                        text['date'],
                        style:
                            robotoMono.copyWith(fontSize: isMobile ? 12 : 24),
                      ),
                    ),
                  ],
                ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(textPaddingWidth, 30, textPaddingWidth, 0),
            child: Text(
              text['detail'],
              style: robotoMono.copyWith(fontSize: isMobile ? 10 : 20),
            ),
          ),
        ],
      ),
    );
  }
}
