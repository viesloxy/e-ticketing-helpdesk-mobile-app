import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_constants.dart';

class AdminNotificationsPage extends StatefulWidget {
  const AdminNotificationsPage({super.key});

  @override
  State<AdminNotificationsPage> createState() => _AdminNotificationsPageState();
}

class _AdminNotificationsPageState extends State<AdminNotificationsPage> {
  List<Map<String, dynamic>> _notifications = [];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() => _notifications = _getMockNotifications());
    }
  }

  List<Map<String, dynamic>> _getMockNotifications() {
    return [
      {'type': 'new_ticket', 'title': 'Tiket Baru', 'message': 'John Doe membuat tiket baru #TK-2024-006', 'time': '5 menit yang lalu', 'isRead': false},
      {'type': 'ticket_assigned', 'title': 'Tiket Ditugaskan', 'message': 'Tiket #TK-2024-005 ditugaskan kepada Anda', 'time': '15 menit yang lalu', 'isRead': false},
      {'type': 'status_update', 'title': 'Status Diperbarui', 'message': 'Tiket #TK-2024-003 berubah menjadi Diproses', 'time': '30 menit yang lalu', 'isRead': false},
      {'type': 'new_ticket', 'title': 'Tiket Baru', 'message': 'Sarah membuat tiket baru #TK-2024-004', 'time': '1 jam yang lalu', 'isRead': true},
      {'type': 'comment', 'title': 'Komentar Baru', 'message': 'John membalas tiket #TK-2024-002', 'time': '2 jam yang lalu', 'isRead': true},
      {'type': 'ticket_completed', 'title': 'Tiket Selesai', 'message': 'Tiket #TK-2024-001 telah selesai', 'time': '3 jam yang lalu', 'isRead': true},
    ];
  }

  int get _unreadCount => _notifications.where((n) => n['isRead'] == false).length;

  IconData _getIcon(String type) {
    switch (type) {
      case 'new_ticket': return Icons.add_circle_outline;
      case 'ticket_assigned': return Icons.assignment_ind;
      case 'status_update': return Icons.update;
      case 'comment': return Icons.chat_bubble_outline;
      case 'ticket_completed': return Icons.check_circle_outline;
      default: return Icons.notifications_outlined;
    }
  }

  Color _getIconColor(String type) {
    switch (type) {
      case 'new_ticket': return const Color(0xFFF59E0B);
      case 'ticket_assigned': return AppColors.primary;
      case 'status_update': return const Color(0xFF3B82F6);
      case 'comment': return AppColors.success;
      case 'ticket_completed': return AppColors.success;
      default: return AppColors.textSecondary;
    }
  }

  void _markAllAsRead() {
    setState(() {
      for (var notif in _notifications) {
        notif['isRead'] = true;
      }
    });
    _showSnackBar('Semua notifikasi ditandai sudah dibaca');
  }

  void _markAsRead(int index) {
    setState(() => _notifications[index]['isRead'] = true);
  }

  void _deleteNotification(int index) {
    setState(() => _notifications.removeAt(index));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMedium))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.surface,
            elevation: 0,
            title: Text('Notifikasi', style: TextStyle(fontSize: isWide ? 20 : 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            centerTitle: true,
            actions: [
              if (_unreadCount > 0)
                TextButton(
                  onPressed: _markAllAsRead,
                  child: Text('Tandai semua dibaca', style: TextStyle(fontSize: isWide ? 15 : 14, fontWeight: FontWeight.w500, color: AppColors.primary)),
                ),
            ],
          ),
          body: _notifications.isEmpty ? _buildEmptyState() : _buildNotificationList(isWide),
        );
      },
    );
  }

  Widget _buildNotificationList(bool isWide) {
    return RefreshIndicator(
      onRefresh: _loadInitialData,
      child: ListView.separated(
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => Divider(height: 1, color: AppColors.divider),
        itemBuilder: (context, index) {
          final notif = _notifications[index];
          return Dismissible(
            key: Key('admin_notif_$index'),
            background: Container(color: AppColors.success.withValues(alpha: 0.2), alignment: Alignment.centerLeft, padding: EdgeInsets.only(left: isWide ? 30 : 20), child: const Icon(Icons.check, color: AppColors.success)),
            secondaryBackground: Container(color: AppColors.error.withValues(alpha: 0.2), alignment: Alignment.centerRight, padding: EdgeInsets.only(right: isWide ? 30 : 20), child: const Icon(Icons.delete, color: AppColors.error)),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                _markAsRead(index);
                return false;
              } else {
                return await _showDeleteConfirmation();
              }
            },
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) _deleteNotification(index);
            },
            child: _NotificationItem(
              icon: _getIcon(notif['type']),
              iconColor: _getIconColor(notif['type']),
              title: notif['title'],
              message: notif['message'],
              time: notif['time'],
              isRead: notif['isRead'],
              isWide: isWide,
              onTap: () {
                _markAsRead(index);
                Navigator.pushNamed(context, '/admin/ticket-detail', arguments: notif);
              },
            ),
          );
        },
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
            Icon(Icons.notifications_off_outlined, size: 64, color: AppColors.textSecondary.withValues(alpha: 0.5)),
            const SizedBox(height: AppConstants.spacingLg),
            const Text('Tidak Ada Notifikasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            const SizedBox(height: AppConstants.spacingSm),
            const Text('Notifikasi akan muncul di sini', style: TextStyle(fontSize: 14, color: AppColors.textSecondary), textAlign: TextAlign.center),
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
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.pop(context, true), style: TextButton.styleFrom(foregroundColor: AppColors.error), child: const Text('Hapus')),
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
  final bool isWide;
  final VoidCallback onTap;

  const _NotificationItem({required this.icon, required this.iconColor, required this.title, required this.message, required this.time, required this.isRead, required this.isWide, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isRead ? AppColors.surface : const Color(0xFFF0F7FF),
        padding: EdgeInsets.all(isWide ? AppConstants.spacingXl : AppConstants.spacingLg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isRead) Container(margin: EdgeInsets.only(right: isWide ? 16 : 12, top: 4), width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)) else SizedBox(width: isWide ? 24 : 20),
            Container(width: isWide ? 48 : 40, height: isWide ? 48 : 40, decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(AppConstants.radiusSmall)), child: Icon(icon, size: isWide ? 24 : 20, color: iconColor)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: isWide ? 15 : 14, fontWeight: isRead ? FontWeight.w400 : FontWeight.w600, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(message, style: TextStyle(fontSize: isWide ? 14 : 13, color: AppColors.textSecondary), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(time, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textSecondary, size: isWide ? 24 : 20),
          ],
        ),
      ),
    );
  }
}