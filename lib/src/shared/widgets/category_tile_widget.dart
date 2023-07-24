import 'package:flutter/material.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';

class CategoryTileWidget extends StatelessWidget {
  const CategoryTileWidget(
      {super.key,
      required this.category,
      required this.isSelected,
      required this.onPressed});

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.customSwatchColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.customContrastColor,
            fontWeight: FontWeight.bold,
            fontSize: isSelected ? 16 : 14,
          ),
        ),
      ),
    );
  }
}
