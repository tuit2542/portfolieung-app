import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContainerCard extends StatefulWidget {
  final String label;
  final String logoStr;
  final bool isLoading;
  final String assetLogoStr;
  final double boxSize;
  final double iconSize;
  final double fontSize;

  const ContainerCard({
    super.key,
    required this.label,
    required this.logoStr,
    this.assetLogoStr = 'assets/logos/',
    this.isLoading = true,
    this.boxSize = 120,
    this.iconSize = 60,
    this.fontSize = 14,
  });

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = onHover ? MyColors.lightPink : MyColors.white;

    if (widget.isLoading) {
      return Container(
        margin: const EdgeInsets.all(10),
        width: widget.boxSize,
        height: widget.boxSize,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[200]!,
                child: Container(
                  width: widget.iconSize,
                  height: widget.iconSize,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 70,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onHover: (value) {
            setState(() {
              onHover = value;
            });
          },
          onTap: () async {
            await launchUrl(
                Uri.parse("https://www.google.com/search?q=${widget.label}"));
          },
          hoverColor: MyColors.lightNavy,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: widget.boxSize,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  "${widget.assetLogoStr}${widget.logoStr.toLowerCase()}.png",
                  height: widget.iconSize,
                  width: widget.iconSize,
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    widget.label,
                    style: robotoMono.copyWith(
                      color: textColor,
                      fontSize: widget.fontSize,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
