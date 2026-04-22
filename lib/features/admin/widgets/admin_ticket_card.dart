import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared/widgets/status_badge.dart';
import '../../../shared/widgets/category_badge.dart';

class AdminTicketCard extends StatelessWidget {
  final String ticketId;
  final String title;
  final String category;
  final String status;
  final String date;
  final String? assignedTo;
  final String priority;
  final bool isSelected;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const AdminTicketCard({
    super.key,
    required this.ticketId,
    required this.title,
    required this.category,
    required this.status,
    required this.date,
    this.assignedTo,
    required this.priority,
    this.isSelected = false,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppConstants.spacingLg),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          border: isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: AppConstants.spacingMd),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 16, color: Colors.white),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        ticketId,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      _buildPriorityBadge(),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacingSm),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppConstants.spacingMd),
                  Row(
                    children: [
                      CategoryBadge(category: category),
                      const SizedBox(width: AppConstants.spacingSm),
                      StatusBadge(status: status),
                      const Spacer(),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  if (assignedTo != null) ...[
                    const SizedBox(height: AppConstants.spacingSm),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 14,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          assignedTo!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getPriorityColor(priority).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getPriorityIcon(priority),
            size: 12,
            color: _getPriorityColor(priority),
          ),
          const SizedBox(width: 4),
          Text(
            _getPriorityLabel(priority),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: _getPriorityColor(priority),
            ),
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'tinggi':
        return AppColors.error;
      case 'sedang':
        return const Color(0xFFF59E0B);
      case 'rendah':
        return AppColors.success;
      default:
        return AppColors.textSecondary;
    }
  }

  IconData _getPriorityIcon(String priority) {
    switch (priority.toLowerCase()) {
      case 'tinggi':
        return Icons.keyboard_double_arrow_up;
      case 'sedang':
        return Icons.remove;
      case 'rendah':
        return Icons.keyboard_double_arrow_down;
      default:
        return Icons.help_outline;
    }
  }

  String _getPriorityLabel(String priority) {
    switch (priority.toLowerCase()) {
      case 'tinggi':
        return 'Tinggi';
      case 'sedang':
        return 'Sedang';
      case 'rendah':
        return 'Rendah';
      default:
        return priority;
    }
  }
}