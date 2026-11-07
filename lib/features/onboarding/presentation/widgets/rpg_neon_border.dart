import 'package:flutter/material.dart';

class RPGNeonBorder extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color glowColor;
  final double borderWidth;

  const RPGNeonBorder({
    super.key,
    required this.child,
    this.baseColor = Colors.deepPurple,
    this.glowColor = Colors.purpleAccent,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.4),
            blurRadius: 8.0,
            spreadRadius: 1.0,
          ),
        ],
        border: Border.all(
          color: baseColor,
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }
}