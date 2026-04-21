# Fitur Ticket History

## Deskripsi Fitur
Halaman Ticket History menampilkan daftar semua tiket yang pernah dibuat oleh pengguna, dengan fitur filter berdasarkan status, pencarian, dan pagination untuk navigasi antar halaman.

## User Flow
1. Pengguna navigasi ke halaman "Tiket Saya"
2. Aplikasi menampilkan daftar tiket pengguna
3. Pengguna dapat:
   - Melihat daftar tiket dengan info singkat
   - Filter berdasarkan status
   - Mencari tiket berdasarkan judul
   - Melihat detail tiket dengan tap
4. Pengguna tap tiket untuk melihat detail

## Komponen UI

### Header
| Elemen | Deskripsi |
|--------|-----------|
| Title | "Tiket Saya" |
| Search Icon | Toggle search bar |
| Filter Icon | Buka filter options |

### Search Bar
| Elemen | Deskripsi |
|--------|-----------|
| Text Input | Input pencarian |
| Clear Button | Hapus pencarian |
| Search Icon | Ikon search |

### Filter Chips
| Filter | Status |
|--------|--------|
| Semua | - |
| Baru | baru |
| Ditangani | ditangani |
| Diproses | diproses |
| Selesai | selesai |

### Ticket Card
| Elemen | Deskripsi |
|--------|-----------|
| Ticket ID | "#TK-2024-001" |
| Title | Judul tiket |
| Category Badge | Kategori tiket |
| Status Badge | Status saat ini |
| Date | Tanggal dibuat |
| Arrow Icon | Indikator navigasi |

### Empty State
| Elemen | Deskripsi |
|--------|-----------|
| Icon | document-text-outline (size 64) |
| Title | "Belum Ada Tiket" |
| Description | "Tiket yang Anda buat akan muncul di sini" |
| CTA Button | "Buat Tiket Baru" |

### Loading State
| Elemen | Deskripsi |
|--------|-----------|
| Skeleton Cards | 3-5 skeleton cards animating |

## Layout Structure
```
┌─────────────────────────┐
│ Header                  │
│ [←]  Tiket Saya   [🔍][☰]│
├─────────────────────────┤
│ Search Bar (collapsible)│
│ ┌─────────────────────┐ │
│ │ 🔍 Cari tiket...    │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ Filter Chips            │
│ [Semua][Baru][Ditang][✓]│
├─────────────────────────┤
│ Ticket List             │
│ ┌─────────────────────┐ │
│ │ #TK-001              │ │
│ │ Judul Tiket         │ │
│ │ [Akademik] [Ditangani]│ │
│ │ 21 Jan 2024      [→]│ │
│ └─────────────────────┘ │
│ ┌─────────────────────┐ │
│ │ #TK-002              │ │
│ │ Judul Tiket         │ │
│ │ [Teknologi] [Baru]   │ │
│ │ 20 Jan 2024      [→]│ │
│ └─────────────────────┘ │
│ ...                     │
├─────────────────────────┤
│ Bottom Navigation        │
└─────────────────────────┘
```

## Design Specifications

### Layout
- Full screen dengan bottom nav
- Sticky header saat scroll
- Pull-to-refresh
- Infinite scroll / pagination
- Safe area padding

### Typography
- **Font Family**: Inter (Google Fonts)
- **Page Title**: 18px, SemiBold (600)
- **Search Text**: 14px, Regular (400)
- **Ticket ID**: 12px, Medium (500), Text Secondary
- **Ticket Title**: 16px, Medium (500)
- **Badge Text**: 11px, Medium (500)
- **Date Text**: 12px, Regular (400), Text Secondary

### Spacing (8pt Grid)
- Screen padding: 16px
- Search bar margin: 12px
- Filter chip gap: 8px
- Ticket card padding: 16px
- Ticket card gap: 12px
- Bottom nav height: 64px

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Background | Light Gray | #F9FAFB |
| Surface | White | #FFFFFF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Border | Light Gray | #E5E7EB |
| Search BG | Light Gray | #F3F4F6 |
| Active Filter | Blue | #2563EB |

### Status Badge Colors
| Status | Background | Text | Hex |
|--------|-------------|------|-----|
| Baru | #FEF3C7 | #92400E | Amber |
| Ditangani | #DBEAFE | #1E40AF | Blue |
| Diproses | #E0E7FF | #3730A3 | Indigo |
| Selesai | #D1FAE5 | #065F46 | Green |

### Category Badge Colors
| Category | Background | Text |
|----------|-------------|------|
| Akademik | #FEF3C7 | #92400E |
| Teknologi | #DBEAFE | #1E40AF |
| Fasilitas | #FCE7F3 | #9D174D |
| Keuangan | #D1FAE5 | #065F46 |
| Lainnya | #E5E7EB | #374151 |

### Border Radius
- Card: 16px
- Search bar: 12px
- Filter chips: 20px (pill)
- Badges: 6px
- Avatar: 50%

### Shadows
- Card shadow: `0 1px 3px 0 rgba(0, 0, 0, 0.1)`
- Header shadow (sticky): `0 1px 3px 0 rgba(0, 0, 0, 0.1)`

## Responsiveness
- Mobile-first (360px - 428px)
- Full width cards
- Touch targets minimum 44x44px
- Smooth scroll dengan momentum

## Animations
- Page transition: slide + fade, 300ms
- Card press: scale(0.98), 100ms
- Filter chip selection: background fade, 200ms
- Pull-to-refresh: spinner animation
- Skeleton shimmer: 1.5s infinite
- Search expand: height transition, 200ms

## Additional Features
- Swipe left on card untuk quick actions (view)
- Long press untuk share ticket info
- Pull down to refresh
- Scroll to top FAB saat scroll jauh
