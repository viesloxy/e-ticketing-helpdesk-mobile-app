# Fitur Register

## Deskripsi Fitur
Halaman register memungkinkan pengguna baru (mahasiswa atau staff) untuk membuat akun baru dengan mengisi data diri mereka.

## User Flow
1. Pengguna mengakses halaman Register
2. Pengguna memasukkan nama lengkap
3. Pengguna memasukkan email aktif
4. Pengguna memilih role (Mahasiswa/Staff)
5. Pengguna memasukkan password
6. Pengguna mengkonfirmasi password
7. Pengguna menekan tombol "Daftar"
8. Sistem memvalidasi dan membuat akun
9. Jika berhasil, pengguna diarahkan ke Login

## Komponen UI

### Elemen Input
| Elemen | Tipe | Validasi | Placeholder |
|--------|------|----------|-------------|
| Nama Lengkap | Text Input | Minimal 3 karakter | "Masukkan nama lengkap" |
| Email | Text Input | Format email valid | "Masukkan email aktif" |
| Password | Password Input | Minimal 8 karakter | "Minimal 8 karakter" |
| Konfirmasi Password | Password Input | Harus sama dengan password | "Ulangi password" |

### Role Selector
| Role | Ikon | Deskripsi |
|------|------|-----------|
| Mahasiswa | school-outline | Untuk mahasiswa universitas |
| Staff | briefcase-outline | Untuk staff/dosen universitas |

### Tombol
| Tombol | Aksi | State |
|--------|------|-------|
| Daftar | Submit form | Default, Loading, Disabled |
| Kembali | Navigasi | Default, Pressed |

### Link
| Link | Navigasi |
|------|----------|
| Masuk | Ke halaman Login |

## States

### Empty State
- Semua input field kosong dengan placeholder

### Validation States
| Field | Rule | Error Message |
|-------|------|---------------|
| Nama | Minimal 3 karakter | "Nama minimal 3 karakter" |
| Email | Format valid | "Format email tidak valid" |
| Password | Minimal 8 karakter | "Password minimal 8 karakter" |
| Konfirmasi | Sama dengan password | "Password tidak cocok" |

### Loading State
- Tombol "Daftar" menampilkan spinner
- Semua field disabled
- Background overlay

### Success State
- Redirect ke halaman Login
- Toast notification "Registrasi berhasil"

### Error State
- Border merah pada field yang error
- Pesan error spesifik ditampilkan

## Design Specifications

### Layout
- Single page, centered card
- Max width: 400px
- Padding: 24px
- Scrollable jika konten overflow

### Typography
- **Font Family**: Inter (Google Fonts)
- **Heading**: 24px, Bold (700)
- **Subheading**: 14px, Regular (400), Text Secondary
- **Input Label**: 14px, Medium (500)
- **Button Text**: 16px, SemiBold (600)
- **Link Text**: 14px, Medium (500)

### Spacing (8pt Grid)
- Card padding: 24px
- Section spacing: 20px
- Input field spacing: 16px
- Button margin-top: 24px

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Primary Hover | Dark Blue | #1D4ED8 |
| Background | Light Gray | #F9FAFB |
| Card Background | White | #FFFFFF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Error | Red | #EF4444 |
| Success | Green | #10B981 |
| Border | Light Gray | #E5E7EB |
| Role Selected BG | Light Blue | #EFF6FF |
| Role Selected Border | Blue | #2563EB |

### Border Radius
- Card: 16px
- Input fields: 12px
- Button: 12px
- Role cards: 12px

### Shadows
- Card shadow: `0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)`

### Icons
- User icon untuk nama
- Mail outline untuk email
- Lock closed untuk password
- Eye/eye-off untuk toggle password visibility
- School outline untuk role Mahasiswa
- Briefcase outline untuk role Staff

## Responsiveness
- Mobile-first design
- Card menyesuaikan lebar layar
- Touch targets minimum 44x44px
- Keyboard-aware layout

## Animations
- Fade-in: 300ms ease-out
- Role selection: scale(1.02) + border color transition, 200ms
- Button press: scale(0.98), 100ms
- Validation error: border color transition, 200ms
