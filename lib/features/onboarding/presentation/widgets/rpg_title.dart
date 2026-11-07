import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RPGTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final double letterSpacing;
  final FontWeight fontWeight;
  final Color glowColor;
  final double glowRadius;
  final double glowOffset;

  const RPGTitle({
    super.key,
    required this.text,
    this.fontSize = 28,
    this.color = Colors.white,
    this.textAlign = TextAlign.center,
    this.overflow = TextOverflow.clip,
    this.maxLines = 1,
    this.letterSpacing = 1.2,
    this.fontWeight = FontWeight.bold,
    this.glowColor = Colors.purpleAccent,
    this.glowRadius = 8.0,
    this.glowOffset = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing,
          shadows: [
            Shadow(
              color: glowColor.withOpacity(0.7),
              blurRadius: glowRadius,
              offset: Offset(glowOffset, glowOffset),
            ),
            Shadow(
              color: glowColor.withOpacity(0.3),
              blurRadius: glowRadius * 0.6,
              offset: Offset(glowOffset * 0.8, glowOffset * 0.8),
            ),
          ],
        ),
      ),
    );
  }
}