import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/hover_widget.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  double width;
  List<Widget> children;
  Function()? onTap;
  bool menuVisible;

  MyAppBar({
    super.key,
    required this.width,
    required this.children,
    this.onTap,
    this.menuVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: menuVisible ? 0 : 4,
      elevation: menuVisible ? 0 : 4,
      shadowColor: Colors.black,
      surfaceTintColor: MyColors.darkNavy,
      shape: RoundedRectangleBorder(
        borderRadius: menuVisible
            ? BorderRadius.zero
            : BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
      ),
      title: Center(
        child: Container(
          margin: width >= 1440
              ? EdgeInsets.zero
              : EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              context.go("/");
            },
            child: HoverKalamText(
              label: "Pongsathorn",
              fontSize: 45,
              textColor: MyColors.white,
            ),
          ),
        ),
      ),
      backgroundColor: MyColors.darkNavy,
      foregroundColor: MyColors.white,
      actions: [
        if (width >= 1440) ...children.map((Widget item) => item),
        if (width < 1440)
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: IconButton(
              icon: menuVisible
                  ? Icon(Icons.close_rounded)
                  : Icon(Icons.menu_rounded),
              onPressed: onTap,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget navButton(
  String label,
  double width, {
  required Function() onTap,
  String underlineString = "",
  bool isMenu = false,
}) {
  return Padding(
    padding: isMenu
        ? const EdgeInsets.all(0)
        : const EdgeInsets.only(left: 50, right: 50),
    child: InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: onTap,
      child: HoverKalamText(
        label: label,
        underline: label.toLowerCase() == underlineString.toLowerCase(),
      ),
    ),
  );
}

Widget footerCredit() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Power by Flutter",
        style: robotoMono.copyWith(
          fontSize: 15,
          color: MyColors.white,
        ),
      ),
    ),
  );
}

Widget appBarMenu(double width, List<Widget> children) {
  return Positioned(
    child: Container(
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.darkNavy,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(3, -3)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children,
        ],
      ),
    ),
  );
}

Widget socialIconRow() {
  List<Map<String, dynamic>> iconList = [
    {'github': 'https://github.com/tuit2542'},
    {'linkedin': 'https://www.linkedin.com/in/pongsathorn-dev/'},
    {'google': 'https://developers.google.com/profile/u/117356101224689028252'},
  ];

  return SizedBox(
    width: 300,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(iconList.length, (index) {
          return socialIcon(iconList[index]);
        }),
      ),
    ),
  );
}

Widget socialIcon(Map<String, dynamic> socialStr) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: MyColors.lightNavy,
        highlightColor: MyColors.lightNavy,
        borderRadius: BorderRadius.circular(100),
        child: ImageIcon(
          AssetImage(
            "assets/logos/contact/${socialStr.keys.first}.png",
          ),
          color: MyColors.white,
        ),
        onTap: () async {
          await launchUrl(Uri.parse(socialStr.values.first));
        },
      ),
    ),
  );
}
