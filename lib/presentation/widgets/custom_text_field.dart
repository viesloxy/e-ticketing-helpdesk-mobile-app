import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.spacingSm),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          enabled: enabled,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.textSecondary, size: 20)
                : null,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppConstants.inputPadding,
              vertical: AppConstants.spacingLg,
            ),
          ),
        ),
      ],
    );
  }
}
