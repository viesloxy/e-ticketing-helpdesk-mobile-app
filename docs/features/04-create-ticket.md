# Fitur Create Ticket

## Deskripsi Fitur
Halaman Create Ticket memungkinkan pengguna untuk membuat tiket helpdesk baru dengan memilih kategori, mengisi judul, deskripsi masalah, prioritas, dan melampirkan file jika diperlukan.

## User Flow
1. Pengguna navigasi ke halaman Buat Tiket (via bottom nav atau Home)
2. Pengguna memilih kategori tiket
3. Pengguna mengisi judul masalah
4. Pengguna mengisi deskripsi detail
5. Pengguna memilih tingkat prioritas
6. (Opsional) Pengguna melampirkan file/gambar
7. Pengguna menekan tombol "Kirim Tiket"
8. Sistem memvalidasi dan menyimpan tiket
9. Jika berhasil, diarahkan ke halaman detail tiket baru

## Komponen UI

### Header
| Elemen | Deskripsi |
|--------|-----------|
| Back Button | Navigasi ke halaman sebelumnya |
| Title | "Buat Tiket Baru" |
| Close Button | Tutup dan kembali (dengan konfirmasi jika ada data) |

### Kategori Selector
| Kategori | Ikon |
|----------|------|
| Akademik | book-outline |
| Teknologi | laptop-outline |
| Fasilitas | business-outline |
| Keuangan | card-outline |
| Lainnya | ellipsis-horizontal-outline |

### Form Fields
| Field | Tipe | Required | Placeholder |
|-------|------|----------|-------------|
| Judul | Text Input | Yes | "Ringkasan masalah Anda" |
| Deskripsi | Textarea | Yes | "Jelaskan masalah Anda secara detail..." |
| Prioritas | Dropdown/Picker | Yes | "Pilih tingkat prioritas" |
| Lampiran | File Upload | No | - |

### Priority Options
| Priority | Level | Warna |
|----------|-------|-------|
| Rendah | 1 | #10B981 (Green) |
| Sedang | 2 | #F59E0B (Orange) |
| Tinggi | 3 | #EF4444 (Red) |

### Attachment Section
| Elemen | Deskripsi |
|--------|-----------|
| Add Button | Tombol untuk menambahkan lampiran |
| File Preview | Preview gambar/thumbnail |
| Remove Button | Hapus lampiran |
| Max Size Info | "Maksimal 5MB per file" |

### Tombol
| Tombol | Aksi | State |
|--------|------|-------|
| Kirim Tiket | Submit form | Default, Loading, Disabled |

## States

### Empty State
- Semua field kosong
- Placeholder text terlihat
- Tombol Kirim disabled

### Validation States
| Field | Rule | Error Message |
|-------|------|---------------|
| Kategori | Harus dipilih | "Pilih kategori tiket" |
| Judul | Minimal 10 karakter | "Judul minimal 10 karakter" |
| Deskripsi | Minimal 20 karakter | "Deskripsi minimal 20 karakter" |
| Prioritas | Harus dipilih | "Pilih tingkat prioritas" |

### Loading State
- Tombol "Kirim" menampilkan spinner
- Form fields disabled
- Background overlay

### Success State
- Redirect ke halaman Detail Tiket
- Toast notification "Tiket berhasil dibuat"
- Confetti/celebration animation (subtle)

### Error State
- Inline error messages
- Border merah pada field yang invalid

## Layout Structure
```
┌─────────────────────────┐
│ Header                  │
│ [←]  Buat Tiket Baru  [X]│
├─────────────────────────┤
│ Kategori                │
│ [Akademik][Teknolog]... │
├─────────────────────────┤
│ Judul *                 │
│ ┌─────────────────────┐ │
│ │ Input field         │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ Deskripsi *             │
│ ┌─────────────────────┐ │
│ │ Multi-line input    │ │
│ │                     │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ Prioritas *             │
│ [Rendah][Sedang][Tinggi]│
├─────────────────────────┤
│ Lampiran (Opsional)      │
│ ┌─────────────────────┐ │
│ │ [+] Tambah File     │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ [     Kirim Tiket     ] │
└─────────────────────────┘
```

## Design Specifications

### Layout
- Full screen dengan app bar
- Content scrollable
- Bottom fixed submit button
- Safe area padding

### Typography
- **Font Family**: Inter (Google Fonts)
- **App Bar Title**: 18px, SemiBold (600)
- **Section Label**: 14px, Medium (500)
- **Input Text**: 16px, Regular (400)
- **Input Label**: 14px, Medium (500)
- **Placeholder**: 16px, Regular (400), Text Secondary
- **Error Text**: 12px, Regular (400)
- **Button Text**: 16px, SemiBold (600)

### Spacing (8pt Grid)
- Screen padding: 16px
- Section spacing: 20px
- Input spacing: 12px
- Category chip gap: 8px
- Button margin-top: 24px

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Primary Hover | Dark Blue | #1D4ED8 |
| Background | Light Gray | #F9FAFB |
| Surface | White | #FFFFFF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Error | Red | #EF4444 |
| Border | Light Gray | #E5E7EB |
| Selected BG | Light Blue | #EFF6FF |
| Selected Border | Blue | #2563EB |
| Disabled | Gray | #9CA3AF |

### Border Radius
- Card/Surface: 16px
- Input fields: 12px
- Category chips: 8px
- Priority buttons: 8px
- Submit button: 12px

### Shadows
- Card shadow: `0 1px 3px 0 rgba(0, 0, 0, 0.1)`
- Bottom button shadow: `0 -2px 8px 0 rgba(0, 0, 0, 0.1)`

## Responsiveness
- Mobile-first (360px - 428px)
- Full width inputs
- Touch targets minimum 44x44px
- Keyboard-aware (scroll to focused field)
- Bottom button stays visible above keyboard

## Animations
- Page transition: slide up, 300ms
- Category selection: scale(1.05) + border, 200ms
- Priority selection: background color fade, 200ms
- Button press: scale(0.98), 100ms
- Success: checkmark animation, 500ms
- Error shake: horizontal, 300ms
