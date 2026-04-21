import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_constants.dart';

class AdminTicketDetailPage extends StatefulWidget {
  final Map<String, dynamic>? ticketData;

  const AdminTicketDetailPage({super.key, this.ticketData});

  @override
  State<AdminTicketDetailPage> createState() => _AdminTicketDetailPageState();
}

class _AdminTicketDetailPageState extends State<AdminTicketDetailPage> {
  final _commentController = TextEditingController();

  final List<Map<String, dynamic>> _statusTimeline = [
    {'status': 'Tiket Dibuat', 'date': '10 Jan 2024, 09:30', 'isCompleted': true, 'isActive': false},
    {'status': 'Ditugaskan', 'date': '10 Jan 2024, 10:15', 'isCompleted': true, 'isActive': false},
    {'status': 'Sedang Diproses', 'date': '10 Jan 2024, 11:00', 'isCompleted': true, 'isActive': true},
    {'status': 'Selesai', 'date': '-', 'isCompleted': false, 'isActive': false},
  ];

  final List<Map<String, dynamic>> _comments = [
    {'user': 'John Staff', 'message': 'Sedang dalam proses reset password.预计需要 2x24 jam.', 'time': '10 Jan 2024, 10:30', 'isAdmin': true},
    {'user': 'Mahasiswa', 'message': 'Baik terima kasih atas informasinya', 'time': '10 Jan 2024, 11:00', 'isAdmin': false},
  ];

  final List<Map<String, dynamic>> _staffOptions = [
    {'name': 'John Staff', 'initial': 'JS'},
    {'name': 'Sarah Admin', 'initial': 'SA'},
    {'name': 'Budi Staff', 'initial': 'BS'},
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ticketData = widget.ticketData ?? {
      'ticketId': '#TK-2024-001',
      'title': 'Permintaan reset password email kampus',
      'category': 'Teknologi',
      'status': 'diproses',
      'date': '5 menit yang lalu',
      'assignedTo': 'John Staff',
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.surface,
            elevation: 0,
            leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
            title: Text('Detail Tiket', style: TextStyle(fontSize: isWide ? 20 : 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            centerTitle: true,
            actions: [IconButton(icon: const Icon(Icons.more_vert, color: AppColors.textPrimary), onPressed: () {})],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isWide ? AppConstants.spacingXl : AppConstants.spacingLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTicketHeader(ticketData, isWide),
                      SizedBox(height: isWide ? AppConstants.spacing2xl : AppConstants.spacingXl),
                      _buildStatusTimeline(isWide),
                      SizedBox(height: isWide ? AppConstants.spacing2xl : AppConstants.spacingXl),
                      _buildAssignmentSection(ticketData, isWide),
                      SizedBox(height: isWide ? AppConstants.spacing2xl : AppConstants.spacingXl),
                      _buildCommentsSection(isWide),
                    ],
                  ),
                ),
              ),
              _buildCommentInput(isWide),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTicketHeader(Map<String, dynamic> ticketData, bool isWide) {
    return Container(
      padding: EdgeInsets.all(isWide ? AppConstants.spacingXl : AppConstants.spacingLg),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppConstants.radiusMedium)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
                child: Text(ticketData['ticketId'] as String, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary)),
              ),
              const SizedBox(width: 8),
              _StatusBadge(status: ticketData['status'] as String),
            ],
          ),
          SizedBox(height: isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
          Text(ticketData['title'] as String, style: TextStyle(fontSize: isWide ? 18 : 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          SizedBox(height: isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
          Row(
            children: [
              _InfoChip(icon: Icons.category_outlined, label: ticketData['category'] as String),
              const SizedBox(width: AppConstants.spacingMd),
              _InfoChip(icon: Icons.access_time, label: ticketData['date'] as String),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTimeline(bool isWide) {
    return Container(
      padding: EdgeInsets.all(isWide ? AppConstants.spacingXl : AppConstants.spacingLg),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppConstants.radiusMedium)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Timeline Status', style: TextStyle(fontSize: isWide ? 16 : 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          SizedBox(height: isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
          ...List.generate(_statusTimeline.length, (index) {
            final item = _statusTimeline[index];
            final isLast = index == _statusTimeline.length - 1;
            return _TimelineItem(title: item['status'] as String, date: item['date'] as String, isCompleted: item['isCompleted'] as bool, isActive: item['isActive'] as bool, isLast: isLast);
          }),
        ],
      ),
    );
  }

  Widget _buildAssignmentSection(Map<String, dynamic> ticketData, bool isWide) {
    return Container(
      padding: EdgeInsets.all(isWide ? AppConstants.spacingXl : AppConstants.spacingLg),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppConstants.radiusMedium)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tugaskan Kepada', style: TextStyle(fontSize: isWide ? 16 : 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          SizedBox(height: isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
          Wrap(
            spacing: AppConstants.spacingSm,
            runSpacing: AppConstants.spacingSm,
            children: _staffOptions.map((staff) {
              final isSelected = ticketData['assignedTo'] == staff['name'];
              return GestureDetector(
                onTap: () {
                  setState(() => ticketData['assignedTo'] = staff['name']);
                  _showSnackBar('Ditugaskan ke ${staff['name']}');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.background,
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: isSelected ? Colors.white.withValues(alpha: 0.3) : AppColors.primary,
                        child: Text(staff['initial'] as String, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : AppColors.primary)),
                      ),
                      const SizedBox(width: 8),
                      Text(staff['name'] as String, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: isSelected ? Colors.white : AppColors.textPrimary)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsSection(bool isWide) {
    return Container(
      padding: EdgeInsets.all(isWide ? AppConstants.spacingXl : AppConstants.spacingLg),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppConstants.radiusMedium)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Komentar', style: TextStyle(fontSize: isWide ? 16 : 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          SizedBox(height: isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _comments.length,
            separatorBuilder: (context, index) => SizedBox(height: isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
            itemBuilder: (context, index) {
              final comment = _comments[index];
              return _CommentItem(name: comment['user'] as String, message: comment['message'] as String, time: comment['time'] as String, isAdmin: comment['isAdmin'] as bool);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput(bool isWide) {
    return Container(
      padding: EdgeInsets.all(isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
      decoration: BoxDecoration(color: AppColors.surface, border: Border(top: BorderSide(color: AppColors.divider))),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Ketik komentar...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppConstants.radiusLarge), borderSide: BorderSide.none),
                  filled: true,
                  fillColor: AppColors.background,
                  contentPadding: EdgeInsets.symmetric(horizontal: isWide ? 20 : 16, vertical: isWide ? 14 : 12),
                ),
              ),
            ),
            const SizedBox(width: AppConstants.spacingSm),
            IconButton(icon: const Icon(Icons.send, color: AppColors.primary), onPressed: () {
              if (_commentController.text.isNotEmpty) {
                _showSnackBar('Komentar dikirim');
                _commentController.clear();
              }
            }),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMedium))),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String label;

    switch (status) {
      case 'baru':
        backgroundColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFF92400E);
        label = 'Baru';
        break;
      case 'ditangani':
        backgroundColor = const Color(0xFFDBEAFE);
        textColor = const Color(0xFF1E40AF);
        label = 'Ditangani';
        break;
      case 'diproses':
        backgroundColor = const Color(0xFFFCE7F3);
        textColor = const Color(0xFF9D174D);
        label = 'Diproses';
        break;
      case 'selesai':
        backgroundColor = const Color(0xFFD1FAE5);
        textColor = const Color(0xFF065F46);
        label = 'Selesai';
        break;
      default:
        backgroundColor = AppColors.background;
        textColor = AppColors.textSecondary;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textColor)),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String date;
  final bool isCompleted;
  final bool isActive;
  final bool isLast;
  const _TimelineItem({required this.title, required this.date, required this.isCompleted, required this.isActive, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.success : (isActive ? AppColors.primary : AppColors.background),
                shape: BoxShape.circle,
                border: Border.all(color: isCompleted ? AppColors.success : (isActive ? AppColors.primary : AppColors.border), width: 2),
              ),
              child: isCompleted ? const Icon(Icons.check, size: 14, color: Colors.white) : (isActive ? const Icon(Icons.circle, size: 8, color: Colors.white) : null),
            ),
            if (!isLast) Container(width: 2, height: 40, color: isCompleted ? AppColors.success : AppColors.border),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14, fontWeight: isActive ? FontWeight.w600 : FontWeight.w400, color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(date, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CommentItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isAdmin;
  const _CommentItem({required this.name, required this.message, required this.time, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: isAdmin ? AppColors.primary : AppColors.textSecondary,
          child: Text(name.split(' ').map((n) => n.isNotEmpty ? n[0] : '').take(2).join(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  if (isAdmin) ...[
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                      child: const Text('Admin', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.primary)),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Text(message, style: const TextStyle(fontSize: 14, color: AppColors.textPrimary)),
              const SizedBox(height: 4),
              Text(time, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ],
    );
  }
}