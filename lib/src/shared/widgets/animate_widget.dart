import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimateSlideWidget extends StatelessWidget {
  Widget child;
  List<Effect<dynamic>> fxList;

  AnimateSlideWidget({
    super.key,
    required this.child,
    this.fxList = const [
      FadeEffect(
        duration: Duration(milliseconds: 1000),
      ),
      SlideEffect(
        begin: Offset(0, 0.2),
        duration: Duration(milliseconds: 1000),
      ),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: fxList,
      child: child,
    );
  }
}
