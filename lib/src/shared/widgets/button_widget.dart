import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/hover_widget.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonWidget extends StatefulWidget {
  final String label;
  final Function() onTap;

  const ButtonWidget({super.key, required this.label, required this.onTap});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    bool isMobile = width < 900;

    Color textColor = onHover ? MyColors.white : MyColors.lightPink;

    return Container(
      width: isMobile ? width * 0.3 : width * 0.15,
      decoration: BoxDecoration(
        color: MyColors.lightNavy,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: MyColors.lightPink,
          borderRadius: BorderRadius.circular(10),
          onTap: widget.onTap,
          onHover: (value) {
            setState(() {
              onHover = value;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text(
                widget.label,
                style: robotoMono.copyWith(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget downloadCV(double width, double height) {
    Color hoverColor = MyColors.lightPink;

    final Uri url = Uri.parse(
        'https://drive.google.com/file/d/1eaINvluOriftS105jItctC_95T_I-SRy/view?usp=drive_link');

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