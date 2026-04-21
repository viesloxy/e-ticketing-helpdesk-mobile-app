# Fitur Notifications

## Deskripsi Fitur
Halaman Notifications menampilkan semua notifikasi yang diterima pengguna terkait tiket mereka, seperti update status, komentar baru, dan pengumuman dari admin.

## User Flow
1. Pengguna navigasi ke halaman Notifikasi
2. Aplikasi menampilkan daftar notifikasi
3. Pengguna dapat:
   - Melihat daftar notifikasi
   - Tap notifikasi untuk melihat detail terkait
   - Swipe atau long press untuk mark as read/unread
   - Hapus notifikasi
4. Mark all as read

## Komponen UI

### Header
| Elemen | Deskripsi |
|--------|-----------|
| Title | "Notifikasi" |
| Mark All Read | Tombol untuk mark semua read |

### Notification List
| Elemen | Deskripsi |
|--------|-----------|
| Notification Card | Item notifikasi |

### Notification Card
| Elemen | Deskripsi |
|--------|-----------|
| Icon | Ikon berdasarkan tipe |
| Title | Judul notifikasi |
| Message | Isi singkat notifikasi |
| Time | Waktu notifikasi |
| Unread Indicator | Dot biru untuk unread |
| Arrow Icon | Navigasi |

### Tipe Notifikasi
| Tipe | Ikon | Warna |
|------|------|-------|
| Status Update | refresh-circle-outline | Blue |
| New Comment | chatbubbles-outline | Green |
| Ticket Created | ticket-outline | Primary Blue |
| Announcement | megaphone-outline | Orange |
| Reminder | alarm-outline | Purple |

### Empty State
| Elemen | Deskripsi |
|--------|-----------|
| Icon | notifications-off-outline (size 64) |
| Title | "Tidak Ada Notifikasi" |
| Description | "Notifikasi akan muncul di sini" |

### Loading State
| Elemen | Deskripsi |
|--------|-----------|
| Skeleton Cards | 5 skeleton cards animating |

## States

### Unread State
- Background slightly blue
- Dot indicator visible
- Bold title text

### Read State
- Background white
- No dot indicator
- Normal title text

### Swipe Actions
| Direction | Action |
|-----------|--------|
| Swipe Left | Delete |
| Swipe Right | Mark as Read/Unread |

## Layout Structure
```
┌─────────────────────────┐
│ Header                  │
│ [←]  Notifikasi   [✓ all]│
├─────────────────────────┤
│ Notification List       │
│ ┌─────────────────────┐ │
│ │ [●] [🔄] Status Updated│ │
│ │ Tiket #TK-001 sudah  │ │
│ │ diproses             │ │
│ │ 5 menit yang lalu → │ │
│ └─────────────────────┘ │
│ ┌─────────────────────┐ │
│ │ [○] [💬] Komentar Baru│ │
│ │ John Doe membalas... │ │
│ │ 1 jam yang lalu →   │ │
│ └─────────────────────┘ │
│ ...                     │
├─────────────────────────┤
│ Bottom Navigation        │
└─────────────────────────┘
```

## Design Specifications

### Layout
- Full screen dengan bottom nav
- Sticky header
- Pull-to-refresh
- Swipeable items
- Safe area padding

### Typography
- **Font Family**: Inter (Google Fonts)
- **Page Title**: 18px, SemiBold (600)
- **Notification Title (Unread)**: 14px, SemiBold (600)
- **Notification Title (Read)**: 14px, Regular (400)
- **Notification Message**: 13px, Regular (400), Text Secondary
- **Time Text**: 12px, Regular (400), Text Secondary

### Spacing (8pt Grid)
- Screen padding: 16px
- Notification padding: 16px
- Notification gap: 1px (divider style)
- Icon size: 40px container
- Unread dot size: 8px

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Background | Light Gray | #F9FAFB |
| Surface | White | #FFFFFF |
| Surface Unread | Light Blue | #F0F7FF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Unread Dot | Blue | #2563EB |
| Border | Light Gray | #E5E7EB |
| Delete Action | Red | #EF4444 |
| Read Action | Green | #10B981 |

### Border Radius
- Card: 0px (full width list)
- Icon container: 12px
- Unread dot: 50%

### Shadows
- Header shadow (sticky): `0 1px 3px 0 rgba(0, 0, 0, 0.1)`

## Responsiveness
- Mobile-first (360px - 428px)
- Full width items
- Touch targets minimum 44x44px
- Swipe gesture dengan haptic feedback

## Animations
- Page transition: slide + fade, 300ms
- Unread appear: fade in, 200ms
- Swipe action: translate + background reveal, 200ms
- Delete: slide out + collapse, 300ms
- Mark read: dot fade out, 200ms
- Pull-to-refresh: spinner
