# Admin Dashboard

## Overview

Halaman Dashboard adalah halaman utama untuk Admin/Helpdesk yang menampilkan overview statistik, data tiket terbaru, dan quick actions. Halaman ini berfungsi sebagai central hub untuk monitoring aktivitas helpdesk.

## Visual Design

### Color Palette

| Color | Hex Code | Usage |
|-------|----------|-------|
| Primary | `#4F46E5` | Navigation, active states, buttons |
| Background | `#F3F4F6` | Page background |
| Surface | `#FFFFFF` | Cards, containers |
| Text Primary | `#111827` | Headings, important text |
| Text Secondary | `#6B7280` | Labels, descriptions |
| Success | `#10B981` | Completed tickets, positive stats |
| Warning | `#F59E0B` | Pending tickets |
| Error | `#EF4444` | High priority, rejected |
| Info | `#3B82F6` | In-progress tickets |

### Typography

| Element | Font | Size | Weight |
|---------|------|------|--------|
| Page Title | Inter | 24px | 700 |
| Section Title | Inter | 18px | 600 |
| Card Title | Inter | 16px | 600 |
| Body Text | Inter | 14px | 400 |
| Caption | Inter | 12px | 400 |

### Spacing System

- Page padding: 16px
- Card padding: 16px
- Section spacing: 24px
- Element spacing: 12px

## Layout Structure

```
┌─────────────────────────────────────┐
│ Header                              │
│ - Admin name & role                 │
│ - Search icon                       │
│ - Profile avatar                    │
├─────────────────────────────────────┤
│ Quick Stats Cards (2x2 Grid)        │
│ ┌─────────┐ ┌─────────┐             │
│ │ Total   │ │ Pending │             │
│ │ Tiket   │ │ Tiket   │             │
│ └─────────┘ └─────────┘             │
│ ┌─────────┐ ┌─────────┐             │
│ │ Diproses│ │ Selesai │             │
│ └─────────┘ └─────────┘             │
├─────────────────────────────────────┤
│ Quick Actions                       │
│ [ + Buat Tiket ] [ 📊 Laporan ]      │
├─────────────────────────────────────┤
│ Kategori Tiket (Horizontal Scroll)  │
│ [Akademik] [Teknologi] [Fasilitas]   │
├─────────────────────────────────────┤
│ Tiket Terbaru                        │
│ ┌─────────────────────────────┐     │
│ │ #TK-001 | Reset Password    │     │
│ │ Akademik | Pending | 2 jam  │     │
│ └─────────────────────────────┘     │
│ ┌─────────────────────────────┐     │
│ │ #TK-002 | AC Rusak          │     │
│ │ Fasilitas | Diproses | 5 jam│     │
│ └─────────────────────────────┘     │
├─────────────────────────────────────┤
│ Admin Bottom Navigation              │
│ [Dashboard][Tiket][Notif][Profil]   │
└─────────────────────────────────────┘
```

## Features & Interactions

### 1. Header Section

| Element | Description |
|---------|-------------|
| Greeting Text | "Selamat datang, [Nama Admin]" |
| Role Badge | Menampilkan "Admin" atau "Helpdesk" |
| Search Button | Icon search, navigasi ke halaman pencarian |
| Profile Avatar | CircleAvatar dengan inisial, navigasi ke profil |

### 2. Quick Stats Cards

| Stat Card | Data | Color |
|-----------|------|-------|
| Total Tiket | Counter semua tiket | Primary (#4F46E5) |
| Pending | Tiket belum ditangani | Warning (#F59E0B) |
| Diproses | Tiket sedang dikerjakan | Info (#3B82F6) |
| Selesai | Tiket yang sudah resolved | Success (#10B981) |

**Interaction:**
- Tap on card → Navigasi ke filtered ticket list berdasarkan status
- Pull to refresh → Update data statistik

### 3. Quick Actions

| Action | Icon | Navigation |
|--------|------|------------|
| Buat Tiket | `Icons.add_circle` | `/admin/create-ticket` |
| Lihat Laporan | `Icons.analytics` | `/admin/statistics` |

### 4. Kategori Tiket

Horizontal scrollable list dengan chip untuk setiap kategori.

| Kategori | Icon | Color |
|----------|------|-------|
| Akademik | `Icons.menu_book` | Amber |
| Teknologi | `Icons.computer` | Blue |
| Fasilitas | `Icons.business` | Pink |
| Keuangan | `Icons.account_balance_wallet` | Green |
| Lainnya | `Icons.more_horiz` | Gray |

**Interaction:**
- Tap chip → Navigasi ke filtered ticket list berdasarkan kategori

### 5. Tiket Terbaru

Menampilkan 5 tiket terbaru dengan info:
- Ticket ID
- Judul Tiket
- Kategori (badge)
- Status (badge)
- Waktu pembuatan

**Interaction:**
- Tap card → Navigasi ke `/admin/ticket-detail/:id`
- Swipe left → Quick action (assign/respond)

### 6. Bottom Navigation

| Tab | Icon (default) | Icon (active) |
|-----|----------------|---------------|
| Dashboard | `home_outlined` | `home` |
| Tiket | `description_outlined` | `description` |
| Notifikasi | `notifications_outlined` | `notifications` |
| Profil | `person_outline` | `person` |

## States

### Loading State
- Skeleton cards untuk statistik
- Shimmer effect untuk list

### Empty State
- Ilustrasi empty box
- Text: "Belum ada tiket"
- CTA button: "Refresh"

### Error State
- Error illustration
- "Gagal memuat data"
- Retry button

## Technical Requirements

### Navigation Routes
- `/admin` - Admin Dashboard (default route untuk role admin)
- `/admin/tickets` - Daftar Tiket
- `/admin/ticket/:id` - Detail Tiket
- `/admin/users` - Manajemen User
- `/admin/statistics` - Laporan
- `/admin/profile` - Profil Admin

### Data Requirements
```dart
// Stats Data
{
  totalTickets: int,
  pendingTickets: int,
  inProgressTickets: int,
  completedTickets: int,
}

// Recent Tickets
{
  id: String,
  ticketId: String,
  title: String,
  category: String,
  status: String,
  createdAt: DateTime,
  priority: String,
}

// Categories
{
  name: String,
  icon: IconData,
  color: Color,
  count: int,
}
```

### Responsive Behavior
- Mobile-first design
- Max width: 480px
- Card grid: 2 columns on mobile

## Dependencies

### Required Pages
- HomePage (Admin Dashboard)
- TicketListPage
- TicketDetailPage
- NotificationsPage
- ProfilePage

### Required Widgets
- StatCard
- CategoryChip
- TicketListItem
- AdminBottomNavBar
- SearchBar

### Required Services
- TicketService (get stats, get recent tickets)
- AuthService (get admin profile)
- NotificationService