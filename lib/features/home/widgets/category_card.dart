import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final int count;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.count,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(AppConstants.spacingMd),
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: textColor),
            const SizedBox(height: AppConstants.spacingSm),
            Text(category, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textColor), textAlign: TextAlign.center),
            const SizedBox(height: AppConstants.spacingXs),
            Text('$count tiket', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: textColor.withValues(alpha: 0.7))),
          ],
        ),
      ),
    );
  }
}
