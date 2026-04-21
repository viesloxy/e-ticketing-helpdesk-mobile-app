import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _getStatusConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: config['bg'] as Color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            config['icon'] as IconData,
            size: 12,
            color: config['text'] as Color,
          ),
          const SizedBox(width: 4),
          Text(
            _getStatusLabel(status),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: config['text'] as Color,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getStatusConfig(String status) {
    switch (status.toLowerCase()) {
      case 'baru':
        return {'bg': const Color(0xFFFEF3C7), 'text': const Color(0xFF92400E), 'icon': Icons.access_time};
      case 'ditangani':
        return {'bg': const Color(0xFFDBEAFE), 'text': const Color(0xFF1E40AF), 'icon': Icons.check};
      case 'diproses':
        return {'bg': const Color(0xFFE0E7FF), 'text': const Color(0xFF3730A3), 'icon': Icons.refresh};
      case 'selesai':
        return {'bg': const Color(0xFFD1FAE5), 'text': const Color(0xFF065F46), 'icon': Icons.check_circle};
      default:
        return {'bg': const Color(0xFFE5E7EB), 'text': const Color(0xFF374151), 'icon': Icons.circle};
    }
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'baru': return 'Baru';
      case 'ditangani': return 'Ditangani';
      case 'diproses': return 'Diproses';
      case 'selesai': return 'Selesai';
      default: return status;
    }
  }
}
