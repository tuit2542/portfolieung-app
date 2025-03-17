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
        '''• Development gateway E-wallet( Mae Manee ) and coordinate product owner.\n( CA API, mountebank, Swagger )\n
• Create new microservices for another team.\n( Java, Spring Boot )\n
• Handle issue request, Find the cause and advise to internal and external parties.\n( Kibana, Log viewer )'''
  };

  Map<String, dynamic> bbtv = {
    'logo': 'assets/logos/career/logo_bbtv.png',
    'name': 'BBTV  New Media Co., Ltd.',
    'position': 'Junior Full Stack Developer',
    'date': 'AUG 2022 - JUL 2023',
    'detail':
        '''• Rectified customer issues within Jira for Frontend Development.\n( Type Script, Angular, React )\n
• Developed an internal pilot application.\n( Flutter, GraphQL, Figma )\n
• Re-Techstack already project.\n( PHP, Laravel, MySQL )'''
  };

  Map<String, dynamic> marine = {
    'logo': 'assets/logos/career/logo_marine.png',
    'name': 'Naval Special Warfare Command,\nRoyal Thai Fleet, Royal Thai Navy',
    'position': 'Marine',
    'date': 'AUG 2023 - JUL 2024',
    'detail':
        '''• Administrative at RTN Recruit Training Center and Fleet Training Command.\n
• Garrison guard, Security, Traffic Soldier and Gunner at Naval Special Wafare Command.'''
  };

  String assetPath = 'assets/images/career';

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
          imageList:
              List.generate(3, (index) => '$assetPath/scb${index + 1}.png'),
        ),
        SizedBox(height: 50),
        Text(
          "Work Experienced",
          style: kalam.copyWith(fontSize: 40, color: MyColors.lightPink),
        ),
        careerDetail(text: bbtv, style: robotoMono, width: width),
        CarouselExample(
          controller: carouselController,
          imageList:
              List.generate(3, (index) => '$assetPath/bbtv${index + 1}.png'),
        ),
        SizedBox(height: 50),
        careerDetail(text: marine, style: robotoMono, width: width),
        CarouselExample(
          controller: carouselController,
          imageList:
              List.generate(3, (index) => '$assetPath/marine${index + 1}.png'),
        ),
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
          imageList:
              List.generate(3, (index) => '$assetPath/scb${index + 1}.png'),
        ),
        SizedBox(height: 50),
        Text(
          "Work Experienced",
          style: kalam.copyWith(fontSize: 50, color: MyColors.lightPink),
        ),
        careerDetail(
            text: bbtv, style: robotoMono, width: width, isMobile: false),
        CarouselExample(
          controller: carouselController,
          imageList:
              List.generate(3, (index) => '$assetPath/bbtv${index + 1}.png'),
        ),
        SizedBox(height: 50),
        careerDetail(
            text: marine, style: robotoMono, width: width, isMobile: false),
        CarouselExample(
          controller: carouselController,
          imageList:
              List.generate(3, (index) => '$assetPath/marine${index + 1}.png'),
        ),
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
    double paddingWidth = width * 0.10;
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
                  style: robotoMono.copyWith(fontSize: isMobile ? 14 : 40),
                ),
                ClipOval(
                  child: Image.asset(
                    text['logo'],
                    width: isMobile ? 40 : 60,
                    height: isMobile ? 40 : 60,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(textPaddingWidth, 0, textPaddingWidth, 20),
            child: Text(
              text['position'],
              style: robotoMono.copyWith(fontSize: isMobile ? 16 : 32),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(textPaddingWidth, 0, textPaddingWidth, 10),
            child: Text(
              text['date'],
              style: robotoMono.copyWith(fontSize: isMobile ? 14 : 24),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(textPaddingWidth, 0, textPaddingWidth, 0),
            child: Text(
              text['detail'],
              style: robotoMono.copyWith(fontSize: isMobile ? 12 : 20),
            ),
          ),
        ],
      ),
    );
  }
}
