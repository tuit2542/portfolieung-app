import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/Career');
          }
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 1.0,
              maxScale: 4.0,
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
