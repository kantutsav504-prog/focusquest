import 'package:flutter/material.dart';
import 'package:focusquest/features/onboarding/presentation/widgets/rpg_neon_border.dart';

class RPGDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String hint;
  final IconData icon;
  final Color dropdownColor;
  final Color borderColor;
  final Color glowColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final bool isExpanded;

  const RPGDropdown({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    required this.hint,
    this.icon = Icons.book,
    this.dropdownColor = const Color(0xFF121212),
    this.borderColor = Colors.deepPurple,
    this.glowColor = Colors.purpleAccent,
    this.borderWidth = 2.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return RPGNeonBorder(
      borderWidth: borderWidth,
      baseColor: borderColor,
      glowColor: glowColor,
      child: Container(
        decoration: BoxDecoration(
          color: dropdownColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: padding,
          child: DropdownButton<T>(
            value: value,
            onChanged: onChanged,
            isExpanded: isExpanded,
            icon: Icon(icon, color: glowColor),
            items: items,
            hint: Text(
              hint,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            dropdownColor: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(8),
            itemHeight: 60,
            menuMaxHeight: 250,
            underline: const SizedBox.shrink(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}