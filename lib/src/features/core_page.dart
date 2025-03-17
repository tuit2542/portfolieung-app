import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/appbar_widget.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';

class CorePage extends StatefulWidget {
  Widget child;
  String label;
  bool isLoading;
  ScrollController? controller;

  @override
  CorePage({
    super.key,
    required this.child,
    this.label = '',
    this.isLoading = false,
    this.controller,
  });

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  List<Widget> appBarChildren(double width, {bool isMenu = false}) {
    return [
      navButton(
        "Home",
        width,
        isMenu: isMenu,
        underlineString: widget.label,
        onTap: () {
          context.go("/Home");
        },
      ),
      navButton(
        "About",
        width,
        isMenu: isMenu,
        underlineString: widget.label,
        onTap: () {
          context.go("/About");
        },
      ),
      navButton(
        "Skills",
        width,
        isMenu: isMenu,
        underlineString: widget.label,
        onTap: () {
          context.go("/Skills");
        },
      ),
      navButton(
        "Career",
        width,
        isMenu: isMenu,
        underlineString: widget.label,
        onTap: () {
          context.go("/Career");
        },
      ),
      navButton(
        "Contact",
        width,
        isMenu: isMenu,
        underlineString: widget.label,
        onTap: () {},
      ),
    ];
  }

  bool _isMenuVisible = false;

  void toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  void hideMenu() {
    setState(() {
      _isMenuVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    bool isMobile = width < 1440;

    if (!isMobile && _isMenuVisible) {
      hideMenu();
    }

    return Scaffold(
      appBar: MyAppBar(
        width: width,
        onTap: toggleMenu,
        children: appBarChildren(width),
      ),
      backgroundColor: MyColors.darkNavy,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Scrollbar(
                controller: widget.controller,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: widget.child,
                )),
          ),
          if (_isMenuVisible && isMobile)
            appBarMenu(
              width,
              appBarChildren(width, isMenu: true),
            ),
        ],
      ),
    );
  }
}
