# Fitur Home

## Deskripsi Fitur
Halaman Home adalah dashboard utama setelah login yang menampilkan ringkasan tiket pengguna, statistik, kategori tiket, dan aksi cepat untuk membuat tiket baru.

## User Flow
1. Pengguna berhasil login
2. Aplikasi menampilkan halaman Home
3. Pengguna dapat melihat:
   - Header dengan greeting dan notifikasi
   - Quick stats (jumlah tiket)
   - Kategori tiket
   - Tiket terbaru
4. Pengguna dapat navigasi ke halaman lain via bottom navigation

## Komponen UI

### Header Section
| Elemen | Deskripsi |
|--------|-----------|
| Greeting Text | "Selamat datang, [Nama]" |
| Avatar | Foto profil pengguna (clickable ke Profile) |
| Notification Bell | Ikon notifikasi dengan badge count |

### Quick Stats Cards
| Stat | Ikon | Warna |
|------|------|-------|
| Total Tiket | document-text-outline | Primary Blue |
| Belum Ditangani | time-outline | Orange |
| Sedang Diproses | refresh-outline | Blue |
| Selesai | checkmark-circle-outline | Green |

### Quick Actions
| Aksi | Ikon | Navigasi |
|------|------|----------|
| Buat Tiket Baru | add-circle-outline | Create Ticket Page |

### Kategori Tiket
| Kategori | Ikon | Jumlah Tiket |
|----------|------|--------------|
| Akademik | book-outline | [count] |
| Teknologi | laptop-outline | [count] |
| Fasilitas | business-outline | [count] |
| Keuangan | card-outline | [count] |
| Lainnya | ellipsis-horizontal-outline | [count] |

### Recent Tickets List
| Elemen | Deskripsi |
|--------|-----------|
| Ticket Card | Judul, kategori badge, status badge, waktu |
| View All Link | Navigasi ke Ticket History |

### Bottom Navigation
| Tab | Ikon | Label |
|-----|------|-------|
| Home | home-outline | Beranda |
| Tiket Saya | document-text-outline | Tiket Saya |
| Buat Tiket | add-circle | Buat |
| Notifikasi | notifications-outline | Notifikasi |
| Profil | person-outline | Profil |

## Layout Structure
```
┌─────────────────────────┐
│ Header (Greeting + Avatar│
├─────────────────────────┤
│ Quick Stats Cards       │
│ [Total][Open][Process][OK]│
├─────────────────────────┤
│ Quick Actions           │
│ [+ Buat Tiket Baru]     │
├─────────────────────────┤
│ Kategori Tiket          │
│ [Akademik][Teknologi]... │
├─────────────────────────┤
│ Tiket Terbaru           │
│ ┌─────────────────────┐ │
│ │ Ticket Card          │ │
│ └─────────────────────┘ │
│ [View All]              │
├─────────────────────────┤
│ Bottom Navigation       │
└─────────────────────────┘
```

## Design Specifications

### Layout
- Full screen dengan bottom nav
- Safe area padding untuk notch/home indicator
- Content scrollable secara vertikal
- Pull-to-refresh enabled

### Typography
- **Font Family**: Inter (Google Fonts)
- **Page Title**: 20px, Bold (700)
- **Greeting**: 16px, Regular (400)
- **Section Title**: 16px, SemiBold (600)
- **Card Title**: 14px, Medium (500)
- **Card Subtitle**: 12px, Regular (400)
- **Stats Number**: 24px, Bold (700)
- **Badge Text**: 11px, Medium (500)

### Spacing (8pt Grid)
- Screen padding: 16px horizontal
- Section spacing: 24px
- Card gap: 12px
- Bottom nav height: 64px (+ safe area)

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Primary Light | Light Blue | #EFF6FF |
| Background | Light Gray | #F9FAFB |
| Surface | White | #FFFFFF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Stat Open | Orange | #F59E0B |
| Stat Process | Blue | #3B82F6 |
| Stat Done | Green | #10B981 |
| Border | Light Gray | #E5E7EB |

### Border Radius
- Cards: 16px
- Buttons: 12px
- Badges: 6px
- Avatar: 50% (circular)
- Bottom nav: 0px (full width)

### Shadows
- Card shadow: `0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)`
- Bottom nav shadow: `0 -1px 3px 0 rgba(0, 0, 0, 0.1)`

### Status Badge Colors
| Status | Background | Text |
|--------|-------------|------|
| Baru | #FEF3C7 | #92400E |
| Ditangani | #DBEAFE | #1E40AF |
| Diproses | #E0E7FF | #3730A3 |
| Selesai | #D1FAE5 | #065F46 |

## Responsiveness
- Mobile-first (360px - 428px)
- Grid responsive untuk stats cards (2x2 di mobile)
- Touch targets minimum 44x44px
- Smooth scroll dengan overscroll glow

## Animations
- Page transition: slide + fade, 300ms
- Card press: scale(0.98), 100ms
- Badge pulse untuk new items
- Pull-to-refresh indicator
- Number counter animation saat load
