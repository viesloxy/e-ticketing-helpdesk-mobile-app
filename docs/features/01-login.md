# Fitur Login

## Deskripsi Fitur
Halaman login adalah titik masuk utama aplikasi yang memungkinkan pengguna (mahasiswa dan staff) untuk mengakses akun mereka menggunakan kredensial email dan password.

## User Flow
1. Pengguna membuka aplikasi
2. Pengguna memasukkan email dan password
3. Pengguna dapat memilih opsi "Ingat saya" (Remember Me)
4. Pengguna menekan tombol "Masuk"
5. Sistem memvalidasi kredensial
6. Jika berhasil, pengguna diarahkan ke halaman Home
7. Jika gagal, menampilkan pesan error

## Komponen UI

### Elemen Input
| Elemen | Tipe | Validasi | Placeholder |
|--------|------|----------|-------------|
| Email | Text Input | Format email valid | "Masukkan email Anda" |
| Password | Password Input | Minimal 8 karakter | "Masukkan password" |

### Tombol
| Tombol | Aksi | State |
|--------|------|-------|
| Masuk | Submit form | Default, Loading, Disabled |
| Lupa Password | Navigasi | Default, Pressed |

### Checkbox
| Elemen | Fungsi |
|--------|--------|
| Ingat saya | Menyimpan preferensi login |

### Link
| Link | Navigasi |
|------|----------|
| Daftar | Ke halaman Register |

## States

### Empty State
- Placeholder text terlihat di setiap input field

### Error State
- Border merah pada field yang error
- Pesan error ditampilkan di bawah field
- Shake animation pada form

### Loading State
- Tombol "Masuk" menampilkan loading spinner
- Input fields disabled
- Background overlay semi-transparan

### Success State
- Redirect ke halaman Home
- Toast notification "Login berhasil"

## Design Specifications

### Layout
- Single page, centered card
- Max width: 400px
- Padding: 32px

### Typography
- **Font Family**: Inter (Google Fonts)
- **Heading**: 24px, Bold (700)
- **Subheading**: 14px, Regular (400)
- **Input Label**: 14px, Medium (500)
- **Button Text**: 16px, SemiBold (600)
- **Link Text**: 14px, Medium (500)

### Spacing (8pt Grid)
- Card padding: 32px
- Input field spacing: 16px
- Button margin-top: 24px
- Element gap: 12px

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Primary Hover | Dark Blue | #1D4ED8 |
| Background | White | #FFFFFF |
| Card Background | White | #FFFFFF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Error | Red | #EF4444 |
| Border | Light Gray | #E5E7EB |
| Input Background | Light Gray | #F9FAFB |

### Border Radius
- Card: 16px
- Input fields: 12px
- Button: 12px

### Shadows
- Card shadow: `0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)`

### Icons
- Email icon: mail-outline (Ionicons)
- Password icon: lock-closed-outline (Ionicons)
- Show/hide password toggle icon
- Arrow forward icon untuk tombol

## Responsiveness
- Mobile-first design
- Card centered horizontally dan vertically
- Touch targets minimum 44x44px
- Input fields full width dalam card

## Animations
- Fade-in saat halaman load: 300ms ease-out
- Button press: scale(0.98), 100ms
- Error shake: 300ms
- Loading spinner: rotate infinite, 1s linear
