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

  const ContainerCard({
    super.key,
    required this.label,
    required this.logoStr,
    this.assetLogoStr = 'assets/logos/',
    this.isLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          margin: const EdgeInsets.all(20),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(20),
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
            width: 120,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  "$assetLogoStr${logoStr.toLowerCase()}.png",
                  height: 60,
                  width: 60,
                ),
                SizedBox(height: 10),
                Center(
                  child: HoverRobotoMonoText(
                    label: label,
                    fontSize: 14,
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
