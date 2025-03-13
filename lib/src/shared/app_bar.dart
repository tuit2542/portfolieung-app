import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongsathorn_port_app/src/styles/colors.dart';

// ignore: must_be_immutable
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
      title: Center(
        child: InkWell(
          onTap: () {
            context.go("/");
          },
          child: Text(
            width >= 1440 ? "Pongsathorn" : "   Pongsathorn",
            style: GoogleFonts.kalam(
              color: MyColors.white,
              fontSize: 40,
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
  bool underline = false,
  bool isMenu = false,
}) {
  return Padding(
    padding: isMenu
        ? const EdgeInsets.all(0)
        : const EdgeInsets.only(left: 50, right: 50),
    child: InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: GoogleFonts.kalam(
          color: underline ? MyColors.lightPink : MyColors.white,
          fontSize: 30,
        ).copyWith(
          decoration: underline ? TextDecoration.underline : null,
          decorationColor: MyColors.lightPink,
          decorationThickness: 3,
        ),
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
    top: 60, // Adjust this based on where you want the menu to appear
    left: width / 2 - 100, // Centering it
    child: Container(
      width: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.lightNavy,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children.map((Widget item) => item),
        ],
      ),
    ),
  );
}
