import 'package:flutter/material.dart';

class BackgroundOverlay extends AnimatedWidget {
  final Color color;
  final double opacity;
  final Animation<double> animation;

  BackgroundOverlay({
    required this.animation,
    this.color = Colors.white,
    this.opacity = 0.8,
  }) : super(listenable: animation);

  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(animation.value * opacity),
    );
  }
}
