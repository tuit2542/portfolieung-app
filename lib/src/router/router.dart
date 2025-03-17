// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pongsathorn_port_app/src/features/pages/about_page.dart';
import 'package:pongsathorn_port_app/src/features/pages/career_page.dart';
import 'package:pongsathorn_port_app/src/features/pages/home_page.dart';
import 'package:pongsathorn_port_app/src/features/pages/skills_page.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/fullscreen_widget.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    // errorBuilder: (context, state) => const NotFoundScreen(),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/Home',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/About',
        builder: (context, state) {
          return const AboutPage();
        },
      ),
      GoRoute(
        path: '/Skills',
        builder: (context, state) {
          return const SkillsPage();
        },
      ),
      GoRoute(
        path: '/Career',
        builder: (context, state) {
          return const CareerPage();
        },
      ),
      GoRoute(
        path: '/Contact',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/Fullscreen',
        builder: (context, state) {
          String imagePath = state.extra.toString();
          return FullScreenImage(
            imageUrl: imagePath,
          );
        },
      ),
    ],
  );
}

// void closeApp() {
//   if (Platform.isAndroid) {
//     SystemNavigator.pop(); // Best practice for Android
//   } else if (Platform.isIOS) {
//     WidgetsBinding.instance.handlePopRoute();
//     // exit(0); // Force quit on iOS (not recommended)
//   }
// }
