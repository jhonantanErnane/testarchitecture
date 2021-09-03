import 'package:flutter/material.dart';

class ContainerDefaultWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets padding;
  final double ?height;

  const ContainerDefaultWidget({
    required this.child,
    this.color = Colors.white,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 16),
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Container(
      height: height,
      // width: screenSize.width,
      color: color,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
