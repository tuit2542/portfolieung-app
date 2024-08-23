import 'package:flutter/material.dart';
import 'package:pongsathorn_port_app/src/features/pages/about_page.dart';
import 'package:pongsathorn_port_app/src/features/pages/home_content.dart';
import 'package:pongsathorn_port_app/src/features/pages/skills_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => const HomeContent(),
          '/Home': (context) => const HomeContent(),
          '/About': (context) => const AboutPage(),
          '/Skills': (context) => const SkillsPage(),
          '/Career': (context) => const HomeContent(),
          '/Contact': (context) => const HomeContent(),
        },
      ),
    );
  }
}
