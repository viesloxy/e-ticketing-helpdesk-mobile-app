# Fitur Ticket Detail

## Deskripsi Fitur
Halaman Ticket Detail menampilkan informasi lengkap dari sebuah tiket, termasuk status, komentar/percakapan dengan staff, dan lampiran. Pengguna dapat melihat perkembangan dan berinteraksi melalui komentar.

## User Flow
1. Pengguna tap ticket card di History
2. Aplikasi menampilkan halaman detail tiket
3. Pengguna dapat:
   - Melihat info lengkap tiket
   - Melihat timeline status
   - Membaca komentar conversation
   - Menambah komentar baru
   - Melihat lampiran
4. Pengguna dapat navigasi back ke History

## Komponen UI

### Header
| Elemen | Deskripsi |
|--------|-----------|
| Back Button | Navigasi ke halaman sebelumnya |
| Ticket ID | "#TK-2024-001" |
| Share Button | Bagikan info tiket |
| More Options | Menu lainnya |

### Ticket Info Card
| Elemen | Deskripsi |
|--------|-----------|
| Title | Judul tiket |
| Category Badge | Kategori tiket |
| Status Badge | Status saat ini |
| Created Date | Tanggal dibuat |
| Priority Badge | Tingkat prioritas |

### Info Details Section
| Field | Value |
|-------|-------|
| Tanggal Dibuat | [datetime] |
| Kategori | [category] |
| Prioritas | [priority] |
| Status | [status] |
| Penanggung Jawab | [staff name] |

### Description Section
| Elemen | Deskripsi |
|--------|-----------|
| Label | "Deskripsi" |
| Content | Isi deskripsi tiket |

### Attachment Section
| Elemen | Deskripsi |
|--------|-----------|
| Label | "Lampiran" |
| File Preview | Thumbnail/gambar/file |
| File Name | Nama file |
| Download Button | Download lampiran |

### Conversation/Comments Section
| Elemen | Deskripsi |
|--------|-----------|
| Label | "Percakapan" |
| Comment List | Daftar komentar |
| Add Comment | Input + tombol kirim |

### Comment Bubble (User)
| Elemen | Deskripsi |
|--------|-----------|
| Avatar | Foto profil pengguna |
| Name | "Anda" |
| Message | Isi komentar |
| Time | Waktu komentar |

### Comment Bubble (Staff)
| Elemen | Deskripsi |
|--------|-----------|
| Avatar | Foto profil staff |
| Name | Nama staff |
| Message | Isi komentar |
| Time | Waktu komentar |

### Comment Input
| Elemen | Deskripsi |
|--------|-----------|
| Text Input | Input komentar |
| Attach Button | Tambahkan lampiran |
| Send Button | Kirim komentar |

### Status Timeline
| Step | Status |
|------|--------|
| 1 | Tiket Dibuat |
| 2 | Ditangani |
| 3 | Diproses |
| 4 | Selesai |

## States

### Loading State
- Skeleton untuk semua section
- Pulsating animation

### Empty Comments State
- Ilustrasi percakapan kosong
- Text: "Belum ada percakapan"

### Comment Sending State
- Comment bubble dengan spinner
- Input disabled

### Closed Ticket State
- Comment input disabled
- Info banner "Tiket sudah ditutup"

## Layout Structure
```
┌─────────────────────────┐
│ Header                  │
│ [←] #TK-001        [↗][⋮]│
├─────────────────────────┤
│ Ticket Info Card        │
│ ┌─────────────────────┐ │
│ │ Judul Tiket         │ │
│ │ [Akademik] [Ditangani]│ │
│ │ Created: 21 Jan 2024 │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ Info Details            │
│ Tanggal: 21 Jan 2024    │
│ Prioritas: Tinggi       │
│ Penanggung: John Doe    │
├─────────────────────────┤
│ Deskripsi               │
│ Lorem ipsum dolor sit...│
├─────────────────────────┤
│ Lampiran                 │
│ [📎 Screenshot.png]      │
├─────────────────────────┤
│ Percakapan              │
│ ┌─────────────────────┐ │
│ │ [Staff Avatar]      │ │
│ │ John Doe            │ │
│ │ Sedang kami tangani │ │
│ │ 10.30 - Hari ini    │ │
│ └─────────────────────┘ │
│ ┌─────────────────────┐ │
│ │ [User Avatar]       │ │
│ │ Anda                │ │
│ │ Terima kasih        │ │
│ │ 10.35 - Hari ini    │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ Comment Input           │
│ [Type a message...][📎][➤]│
└─────────────────────────┘
```

## Design Specifications

### Layout
- Full screen dengan sticky header
- Scrollable content
- Fixed bottom comment input
- Safe area padding

### Typography
- **Font Family**: Inter (Google Fonts)
- **Page Title (ID)**: 16px, Medium (500)
- **Ticket Title**: 18px, SemiBold (600)
- **Section Label**: 14px, Medium (500)
- **Info Label**: 14px, Regular (400), Text Secondary
- **Info Value**: 14px, Medium (500)
- **Comment Name**: 14px, Medium (500)
- **Comment Message**: 14px, Regular (400)
- **Comment Time**: 12px, Regular (400), Text Secondary

### Spacing (8pt Grid)
- Screen padding: 16px
- Section spacing: 20px
- Card padding: 16px
- Comment bubble padding: 12px
- Comment gap: 8px
- Comment input padding: 12px
- Comment input height: 48px

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Background | Light Gray | #F9FAFB |
| Surface | White | #FFFFFF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Border | Light Gray | #E5E7EB |
| User Comment BG | Blue | #2563EB |
| User Comment Text | White | #FFFFFF |
| Staff Comment BG | White | #FFFFFF |
| Staff Comment Text | Dark Gray | #1F2937 |
| Input Background | Light Gray | #F3F4F6 |

### Border Radius
- Card: 16px
- Badges: 6px
- Comment bubbles: 16px (top-left sharp untuk first, all rounded untuk middle, top-left sharp untuk last)
- Input field: 24px (pill)
- Avatar: 50%

### Shadows
- Card shadow: `0 1px 3px 0 rgba(0, 0, 0, 0.1)`
- Staff comment shadow: `0 1px 2px 0 rgba(0, 0, 0, 0.05)`
- Comment input shadow: `0 -1px 3px 0 rgba(0, 0, 0, 0.1)`

## Responsiveness
- Mobile-first (360px - 428px)
- Full width sections
- Touch targets minimum 44x44px
- Keyboard-aware (input stays visible)

## Animations
- Page transition: slide from right, 300ms
- Comment appear: fade + slide up, 200ms
- Send button: scale(0.9) on press, 100ms
- Status badge pulse saat update
- New comment highlight: border glow, 1s

## Additional Features
- Copy ticket ID dengan tap
- Share ticket info
- Image zoom untuk lampiran
- Scroll ke comment terbaru otomatis
- Typing indicator saat staff membalas
