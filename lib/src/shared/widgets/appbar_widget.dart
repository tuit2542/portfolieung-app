import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/hover_widget.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  double width;
  List<Widget> children;
  Function()? onTap;

  MyAppBar({
    super.key,
    required this.width,
    required this.children,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: MyColors.darkNavy,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
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
              fontSize: 40,
              textColor: MyColors.lightPink,
            ),
          ),
        ),
      ),
      backgroundColor: MyColors.darkNavy,
      foregroundColor: MyColors.white,
      actions: [
        if (width >= 1440) ...children.map((Widget item) => item),
        if (width < 1440)
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: onTap,
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
  return Align(
    alignment: Alignment.bottomCenter,
    child: Text(
      "Power by Flutter",
      style: GoogleFonts.robotoMono(
        fontSize: 15,
        color: MyColors.white,
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
          BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(3, 3)),
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
