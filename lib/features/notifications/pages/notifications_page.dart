import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'type': 'status_update',
      'title': 'Status Tiket Diperbarui',
      'message': 'Tiket #TK-2024-001 sedang diproses',
      'time': '5 menit yang lalu',
      'isRead': false,
    },
    {
      'type': 'new_comment',
      'title': 'Komentar Baru',
      'message': 'John Doe membalas tiket Anda',
      'time': '1 jam yang lalu',
      'isRead': false,
    },
    {
      'type': 'ticket_created',
      'title': 'Tiket Dibuat',
      'message': 'Tiket #TK-2024-002 berhasil dibuat',
      'time': '2 jam yang lalu',
      'isRead': true,
    },
    {
      'type': 'status_update',
      'title': 'Tiket Selesai',
      'message': 'Tiket #TK-2024-003 telah selesai',
      'time': '1 hari yang lalu',
      'isRead': true,
    },
    {
      'type': 'announcement',
      'title': 'Pengumuman',
      'message': 'Sistem maintenance dijadwalkan',
      'time': '2 hari yang lalu',
      'isRead': true,
    },
  ];

  int get _unreadCount => _notifications.where((n) => n['isRead'] == false).length;

  IconData _getIcon(String type) {
    switch (type) {
      case 'status_update':
        return Icons.update;
      case 'new_comment':
        return Icons.chat_bubble_outline;
      case 'ticket_created':
        return Icons.add_circle_outline;
      case 'announcement':
        return Icons.campaign_outlined;
      case 'reminder':
        return Icons.alarm_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }

  Color _getIconColor(String type) {
    switch (type) {
      case 'status_update':
        return const Color(0xFF3B82F6);
      case 'new_comment':
        return AppColors.success;
      case 'ticket_created':
        return AppColors.primary;
      case 'announcement':
        return const Color(0xFFF59E0B);
      case 'reminder':
        return const Color(0xFF8B5CF6);
      default:
        return AppColors.textSecondary;
    }
  }

  void _markAllAsRead() {
    setState(() {
      for (var notif in _notifications) {
        notif['isRead'] = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Semua notifikasi ditandai sudah dibaca'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMedium)),
      ),
    );
  }

  void _markAsRead(int index) {
    setState(() {
      _notifications[index]['isRead'] = true;
    });
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text(
          'Notifikasi',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        ),
        centerTitle: true,
        actions: [
          if (_unreadCount > 0)
            TextButton(
              onPressed: _markAllAsRead,
              child: const Text(
                'Tandai semua dibaca',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primary),
              ),
            ),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: () async => await Future.delayed(const Duration(seconds: 1)),
              child: ListView.separated(
                itemCount: _notifications.length,
                separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.divider),
                itemBuilder: (context, index) {
                  final notif = _notifications[index];
                  return Dismissible(
                    key: Key('notif_$index'),
                    background: Container(
                      color: AppColors.success.withValues(alpha: 0.2),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Icon(Icons.check, color: AppColors.success),
                    ),
                    secondaryBackground: Container(
                      color: AppColors.error.withValues(alpha: 0.2),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: AppColors.error),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        _markAsRead(index);
                        return false;
                      } else {
                        return await _showDeleteConfirmation();
                      }
                    },
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        _deleteNotification(index);
                      }
                    },
                    child: _NotificationItem(
                      icon: _getIcon(notif['type']),
                      iconColor: _getIconColor(notif['type']),
                      title: notif['title'],
                      message: notif['message'],
                      time: notif['time'],
                      isRead: notif['isRead'],
                      onTap: () {
                        _markAsRead(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Buka: ${notif['title']}'),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing2xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 64,
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppConstants.spacingLg),
            const Text(
              'Tidak Ada Notifikasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            ),
            const SizedBox(height: AppConstants.spacingSm),
            const Text(
              'Notifikasi akan muncul di sini',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showDeleteConfirmation() async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusLarge)),
        title: const Text('Hapus Notifikasi?'),
        content: const Text('Notifikasi ini akan dihapus.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Hapus'),
          ),
        ],
      ),
    ) ?? false;
  }
}

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final VoidCallback onTap;

  const _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isRead ? AppColors.surface : const Color(0xFFF0F7FF),
        padding: const EdgeInsets.all(AppConstants.spacingLg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unread dot
            if (!isRead)
              Container(
                margin: const EdgeInsets.only(right: 12, top: 4),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              )
            else
              const SizedBox(width: 20),

            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),

            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),

            // Arrow
            const Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20),
          ],
        ),
      ),
    );
  }
}
