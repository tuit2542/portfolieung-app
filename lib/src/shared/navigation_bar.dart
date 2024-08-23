import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    // double height = size.height;

    return width > 1440
        ? Container(
            decoration: const BoxDecoration(
              color: MyColors.darkNavy,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ],
            ),
            height: 80,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 50, 0),
                  child: Text(
                    "Pongsathorn",
                    style: GoogleFonts.kalam(
                      color: MyColors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(width * 25 / 100, 0, 0, 0),
                  child: Row(
                    children: [
                      navButton(
                        "Home",
                        width,
                        function: () {
                          Navigator.pushNamed(context, '/Home');
                        },
                      ),
                      navButton(
                        "About",
                        width,
                        function: () {
                          Navigator.pushNamed(context, '/About');
                        },
                      ),
                      navButton(
                        "Skills",
                        width,
                        function: () {
                          Navigator.pushNamed(context, '/Skills');
                        },
                      ),
                      navButton(
                        "Career",
                        width,
                        function: () {},
                      ),
                      navButton(
                        "Contact",
                        width,
                        function: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            decoration: const BoxDecoration(
              color: MyColors.darkNavy,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ],
            ),
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "   Pongsathorn",
                      style: GoogleFonts.kalam(
                        color: MyColors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                InkWell(
                  child: const Icon(
                    Icons.menu,
                    color: MyColors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          );
  }
}

Widget navButton(
  String label,
  double width, {
  required Function() function,
}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(width * 5 / 100, 0, 0, 0),
    child: InkWell(
      onTap: () {
        function();
      },
      child: Text(
        label,
        style: GoogleFonts.kalam(color: MyColors.white, fontSize: 30),
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
