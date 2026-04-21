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
  final VoidCallback? onTap;

  const AdminTicketCard({
    super.key,
    required this.ticketId,
    required this.title,
    required this.category,
    required this.status,
    required this.date,
    this.assignedTo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spacingLg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getPriorityColor(status).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getPriorityIcon(status),
                        size: 12,
                        color: _getPriorityColor(status),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _getPriorityLabel(status),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: _getPriorityColor(status),
                        ),
                      ),
                    ],
                  ),
                ),
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
    );
  }

  Color _getPriorityColor(String status) {
    switch (status.toLowerCase()) {
      case 'baru':
        return const Color(0xFFF59E0B);
      case 'ditangani':
      case 'diproses':
        return const Color(0xFF3B82F6);
      case 'selesai':
        return AppColors.success;
      case 'ditolak':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }

  IconData _getPriorityIcon(String status) {
    switch (status.toLowerCase()) {
      case 'baru':
        return Icons.fiber_new;
      case 'ditangani':
        return Icons.support_agent;
      case 'diproses':
        return Icons.pending;
      case 'selesai':
        return Icons.check_circle;
      case 'ditolak':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  String _getPriorityLabel(String status) {
    switch (status.toLowerCase()) {
      case 'baru':
        return 'Baru';
      case 'ditangani':
        return 'Ditangani';
      case 'diproses':
        return 'Diproses';
      case 'selesai':
        return 'Selesai';
      case 'ditolak':
        return 'Ditolak';
      default:
        return status;
    }
  }
}