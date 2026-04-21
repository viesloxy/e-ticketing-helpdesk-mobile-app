# Fitur Profile

## Deskripsi Fitur
Halaman Profile menampilkan informasi akun pengguna, memungkinkan pengguna mengedit profil, mengatur preferensi aplikasi, dan logout.

## User Flow
1. Pengguna navigasi ke halaman Profil
2. Aplikasi menampilkan info profil
3. Pengguna dapat:
   - Melihat info akun
   - Edit profil
   - Mengubah password
   - Mengatur notifikasi
   - Logout

## Komponen UI

### Header
| Elemen | Deskripsi |
|--------|-----------|
| Title | "Profil" |
| Edit Button | Edit profil |

### Profile Card
| Elemen | Deskripsi |
|--------|-----------|
| Avatar | Foto profil (clickable untuk edit) |
| Name | Nama lengkap |
| Email | Email pengguna |
| Role Badge | Mahasiswa / Staff |

### Profile Info Section
| Field | Value |
|-------|-------|
| Nama Lengkap | [name] |
| Email | [email] |
| Role | [mahasiswa/staff] |
| NIM/NIP | [number] |
| Jurusan/Unit | [department] |

### Menu Items
| Menu | Ikon | Navigasi |
|------|------|----------|
| Edit Profil | create-outline | Edit Profile Page |
| Ubah Password | lock-closed-outline | Change Password Page |
| Pengaturan Notifikasi | notifications-outline | Notification Settings |
| Bahasa | language-outline | Language Selection |
| Tentang Aplikasi | information-circle-outline | About App |
| Kebijakan Privasi | shield-checkmark-outline | Privacy Policy |
| Logout | log-out-outline | Logout Confirmation |

### Edit Profile Page
| Elemen | Deskripsi |
|--------|-----------|
| Avatar Section | Foto + Change button |
| Form Fields | Name, Email, Phone |
| Save Button | Simpan perubahan |

### Change Password Page
| Elemen | Deskripsi |
|--------|-----------|
| Current Password | Password lama |
| New Password | Password baru |
| Confirm Password | Konfirmasi password |
| Save Button | Update password |

### Logout Confirmation Modal
| Elemen | Deskripsi |
|--------|-----------|
| Icon | log-out-outline |
| Title | "Keluar?" |
| Message | "Apakah Anda yakin ingin keluar?" |
| Cancel Button | Batal |
| Logout Button | Konfirmasi logout |

## States

### Loading State
- Skeleton untuk profile card
- Skeleton untuk menu items

### Edit Mode State
- Fields menjadi editable
- Save/Cancel buttons appear
- Validation messages

### Success State
- Toast notification "Profil berhasil diperbarui"
- Refresh profile data

### Logout Modal
- Centered modal dengan backdrop
- Two buttons: Cancel, Logout

## Layout Structure
```
┌─────────────────────────┐
│ Header                  │
│ [←]  Profil         [✏️]│
├─────────────────────────┤
│ Profile Card             │
│ ┌─────────────────────┐ │
│ │      [Avatar]       │ │
│ │    Nama Lengkap     │ │
│ │    email@domain.com  │ │
│ │    [Mahasiswa]      │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ Info Details            │
│ NIM: 12345678          │
│ Jurusan: Informatika    │
├─────────────────────────┤
│ Menu List               │
│ ┌─────────────────────┐ │
│ │ ✏️ Edit Profil      →│ │
│ ├─────────────────────┤ │
│ │ 🔒 Ubah Password   →│ │
│ ├─────────────────────┤ │
│ │ 🔔 Notifikasi      →│ │
│ ├─────────────────────┤ │
│ │ 🌍 Bahasa          →│ │
│ ├─────────────────────┤ │
│ │ ℹ️ Tentang         →│ │
│ ├─────────────────────┤ │
│ │ 🚪 Logout           │ │
│ └─────────────────────┘ │
├─────────────────────────┤
│ Bottom Navigation        │
└─────────────────────────┘
```

## Design Specifications

### Layout
- Full screen dengan bottom nav
- Sticky header
- Scrollable content
- Safe area padding

### Typography
- **Font Family**: Inter (Google Fonts)
- **Page Title**: 18px, SemiBold (600)
- **Name**: 20px, SemiBold (600)
- **Email**: 14px, Regular (400), Text Secondary
- **Section Label**: 14px, Medium (500)
- **Menu Item**: 16px, Regular (400)
- **Info Label**: 14px, Regular (400), Text Secondary
- **Info Value**: 14px, Medium (500)

### Spacing (8pt Grid)
- Screen padding: 16px
- Profile card padding: 24px
- Avatar size: 80px
- Section spacing: 20px
- Menu item padding: 16px vertical
- Menu item gap: 1px (divider)

### Colors
| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #2563EB |
| Background | Light Gray | #F9FAFB |
| Surface | White | #FFFFFF |
| Text Primary | Dark Gray | #1F2937 |
| Text Secondary | Gray | #6B7280 |
| Border | Light Gray | #E5E7EB |
| Divider | Light Gray | #F3F4F6 |
| Danger | Red | #EF4444 |
| Role Badge BG | Light Blue | #EFF6FF |
| Role Badge Text | Blue | #2563EB |

### Border Radius
- Card: 16px
- Avatar: 50%
- Menu items: 0px (with dividers)
- Buttons: 12px
- Modal: 16px

### Shadows
- Card shadow: `0 1px 3px 0 rgba(0, 0, 0, 0.1)`
- Modal overlay: `rgba(0, 0, 0, 0.5)`

### Icons
- Pencil outline untuk edit
- Log out untuk logout
- Chevron right untuk navigation indicator

## Responsiveness
- Mobile-first (360px - 428px)
- Full width sections
- Touch targets minimum 44x44px

## Animations
- Page transition: slide + fade, 300ms
- Avatar tap: scale(0.95), 100ms
- Menu item press: background color, 100ms
- Modal: fade + scale, 200ms
- Logout: slide down + fade out, 300ms
