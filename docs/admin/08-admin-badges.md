# Admin Status Badges

## Overview

Koleksi komponen badge yang digunakan di halaman Admin untuk menampilkan status, kategori, prioritas, dan role.

## Status Badge

### Badge Variants

| Status | Background Color | Text Color | Icon |
|--------|-----------------|------------|------|
| baru | Warning Light | Warning Dark | `fiber_new` |
| ditangani | Info Light | Info Dark | `support_agent` |
| diproses | Primary Light | Primary Dark | `pending` |
| selesai | Success Light | Success Dark | `check_circle` |
| ditolak | Error Light | Error Dark | `cancel` |

### Visual Design

```
┌─────────────────────────────────────┐
│                                     │
│  [ baru ]  [ ditangani ]  [selesai]│
│                                     │
└─────────────────────────────────────┘
```

### Color Codes

```dart
// Status Colors
const statusColors = {
  'baru': {
    'background': Color(0xFFFEF3C7), // Amber 100
    'text': Color(0xFF92400E),       // Amber 800
  },
  'ditangani': {
    'background': Color(0xFFDBEAFE), // Blue 100
    'text': Color(0xFF1E40AF),       // Blue 800
  },
  'diproses': {
    'background': Color(0xFFEEF2FF), // Indigo 100
    'text': Color(0xFF4F46E5),        // Indigo 600
  },
  'selesai': {
    'background': Color(0xFFD1FAE5), // Green 100
    'text': Color(0xFF065F46),       // Green 800
  },
  'ditolak': {
    'background': Color(0xFFFEE2E2), // Red 100
    'text': Color(0xFF991B1B),        // Red 800
  },
};
```

### Usage

```dart
StatusBadge(
  status: 'diproses',
  showIcon: true,
  size: 'medium', // 'small', 'medium', 'large'
)
```

## Priority Badge

### Badge Variants

| Priority | Background Color | Text Color | Icon |
|----------|-----------------|------------|------|
| tinggi | Error Light | Error Dark | `keyboard_double_arrow_up` |
| sedang | Warning Light | Warning Dark | `remove` |
| rendah | Success Light | Success Dark | `keyboard_double_arrow_down` |

### Visual Design

```
┌─────────────────────────────────────┐
│                                     │
│  [⚡ Tinggi]  [─ Sedang]  [↓ Rendah]│
│                                     │
└─────────────────────────────────────┘
```

### Color Codes

```dart
// Priority Colors
const priorityColors = {
  'tinggi': {
    'background': Color(0xFFFEE2E2),
    'text': Color(0xFF991B1B),
    'icon': Color(0xFFEF4444),
  },
  'sedang': {
    'background': Color(0xFFFEF3C7),
    'text': Color(0xFF92400E),
    'icon': Color(0xFFF59E0B),
  },
  'rendah': {
    'background': Color(0xFFD1FAE5),
    'text': Color(0xFF065F46),
    'icon': Color(0xFF10B981),
  },
};
```

## Category Badge

### Badge Variants

| Category | Background Color | Text Color | Icon |
|----------|-----------------|------------|------|
| akademik | Amber Light | Amber Dark | `menu_book` |
| teknologi | Blue Light | Blue Dark | `computer` |
| fasilitas | Pink Light | Pink Dark | `business` |
| keuangan | Green Light | Green Dark | `account_balance_wallet` |
| lainnya | Gray Light | Gray Dark | `more_horiz` |

### Visual Design

```
┌─────────────────────────────────────┐
│                                     │
│  [📚 Akademik]  [💻 Teknologi]     │
│  [🏢 Fasilitas]  [💰 Keuangan]     │
│                                     │
└─────────────────────────────────────┘
```

### Color Codes

```dart
// Category Colors
const categoryColors = {
  'akademik': {
    'background': Color(0xFFFEF3C7),
    'text': Color(0xFF92400E),
    'icon': Color(0xFFF59E0B),
  },
  'teknologi': {
    'background': Color(0xFFDBEAFE),
    'text': Color(0xFF1E40AF),
    'icon': Color(0xFF3B82F6),
  },
  'fasilitas': {
    'background': Color(0xFFFCE7F3),
    'text': Color(0xFF9D174D),
    'icon': Color(0xFFEC4899),
  },
  'keuangan': {
    'background': Color(0xFFD1FAE5),
    'text': Color(0xFF065F46),
    'icon': Color(0xFF10B981),
  },
  'lainnya': {
    'background': Color(0xFFE5E7EB),
    'text': Color(0xFF374151),
    'icon': Color(0xFF6B7280),
  },
};
```

## Role Badge

### Badge Variants

| Role | Background Color | Text Color |
|------|-----------------|------------|
| admin | Primary Light | Primary Dark |
| helpdesk | Info Light | Info Dark |
| staff | Success Light | Success Dark |
| mahasiswa | Gray Light | Gray Dark |

### Visual Design

```
┌─────────────────────────────────────┐
│                                     │
│  [Admin]  [Helpdesk]  [Mahasiswa]   │
│                                     │
└─────────────────────────────────────┘
```

## Code Implementation

### StatusBadge Widget

```dart
class StatusBadge extends StatelessWidget {
  final String status;
  final bool showIcon;
  final String size; // 'small', 'medium', 'large'

  const StatusBadge({
    Key? key,
    required this.status,
    this.showIcon = true,
    this.size = 'medium',
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getStatusColors(status);
    final iconSize = _getIconSize(size);
    final fontSize = _getFontSize(size);
    final padding = _getPadding(size);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: padding / 2,
      ),
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(
              _getStatusIcon(status),
              size: iconSize,
              color: colors['text'],
            ),
            SizedBox(width: iconSize / 2),
          ],
          Text(
            _getStatusLabel(status),
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: colors['text'],
            ),
          ),
        ],
      ),
    );
  }
}
```

## Sizes

| Size | Font Size | Icon Size | Padding |
|------|-----------|-----------|---------|
| small | 10px | 12px | 6px |
| medium | 12px | 14px | 8px |
| large | 14px | 16px | 10px |

## Dependencies

### Required Imports
- app_colors.dart
- flutter/material.dart