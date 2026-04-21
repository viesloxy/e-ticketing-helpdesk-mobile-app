import 'package:flutter/material.dart';

class CategoryBadge extends StatelessWidget {
  final String category;

  const CategoryBadge({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final config = _getCategoryConfig(category);

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
            _getCategoryLabel(category),
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

  Map<String, dynamic> _getCategoryConfig(String category) {
    switch (category.toLowerCase()) {
      case 'akademik':
        return {'bg': const Color(0xFFFEF3C7), 'text': const Color(0xFF92400E), 'icon': Icons.menu_book_outlined};
      case 'teknologi':
        return {'bg': const Color(0xFFDBEAFE), 'text': const Color(0xFF1E40AF), 'icon': Icons.laptop_mac};
      case 'fasilitas':
        return {'bg': const Color(0xFFFCE7F3), 'text': const Color(0xFF9D174D), 'icon': Icons.business_outlined};
      case 'keuangan':
        return {'bg': const Color(0xFFD1FAE5), 'text': const Color(0xFF065F46), 'icon': Icons.credit_card_outlined};
      default:
        return {'bg': const Color(0xFFE5E7EB), 'text': const Color(0xFF374151), 'icon': Icons.more_horiz};
    }
  }

  String _getCategoryLabel(String category) {
    switch (category.toLowerCase()) {
      case 'akademik': return 'Akademik';
      case 'teknologi': return 'Teknologi';
      case 'fasilitas': return 'Fasilitas';
      case 'keuangan': return 'Keuangan';
      case 'lainnya': return 'Lainnya';
      default: return category;
    }
  }
}
