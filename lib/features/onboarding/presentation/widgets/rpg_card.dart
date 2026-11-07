import 'package:flutter/material.dart';
import 'package:focusquest/features/onboarding/presentation/widgets/rpg_neon_border.dart';

class RPGCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool isSelected;

  const RPGCard({
    super.key,
    required this.child,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RPGNeonBorder(
        baseColor: isSelected ? Colors.purpleAccent : Colors.deepPurple.shade700,
        glowColor: isSelected ? Colors.purpleAccent : Colors.transparent,
        borderWidth: isSelected ? 3.0 : 1.5,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1A1A3A) : const Color(0xFF121222),
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    );
  }
}