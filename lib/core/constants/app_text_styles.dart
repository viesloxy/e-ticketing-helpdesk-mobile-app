import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.33,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.33,
    color: AppColors.textPrimary,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    color: AppColors.textSecondary,
  );

  // Caption & Labels
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    color: AppColors.textSecondary,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    color: AppColors.textSecondary,
  );

  // Button Text
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Colors.white,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    color: Colors.white,
  );
}
