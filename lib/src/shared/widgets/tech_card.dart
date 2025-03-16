import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/styles/colors.dart';
import 'package:pongsathorn_port_app/src/styles/hover_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContainerCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          margin: const EdgeInsets.all(10),
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await launchUrl(
                Uri.parse("https://www.google.com/search?q=$label"));
          },
          hoverColor: MyColors.lightNavy,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: boxSize,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  "$assetLogoStr${logoStr.toLowerCase()}.png",
                  height: iconSize,
                  width: iconSize,
                ),
                SizedBox(height: 10),
                Center(
                  child: HoverRobotoMonoText(
                    label: label,
                    fontSize: fontSize,
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
