# Admin User Management

## Overview

Halaman Manajemen User untuk Admin yang memungkinkan mengelola data pengguna (mahasiswa dan staff) termasuk melihat detail, mengedit role, dan mengatur status akun.

## Visual Design

### Color Palette

| Color | Hex Code | Usage |
|-------|----------|-------|
| Primary | `#4F46E5` | Buttons, links |
| Background | `#F3F4F6` | Page background |
| Surface | `#FFFFFF` | Cards, tables |
| Text Primary | `#111827` | Headings |
| Text Secondary | `#6B7280` | Labels |
| Success | `#10B981` | Active status |
| Warning | `#F59E0B` | Pending status |
| Error | `#EF4444` | Inactive/Blocked |

### Typography

| Element | Font | Size | Weight |
|---------|------|------|--------|
| Page Title | Inter | 20px | 600 |
| Section Title | Inter | 16px | 600 |
| Table Header | Inter | 12px | 600 |
| Table Cell | Inter | 14px | 400 |
| Badge | Inter | 11px | 500 |

## Layout Structure

```
┌─────────────────────────────────────┐
│ Header                              │
│ [←] Manajemen User     [🔍] [➕]    │
├─────────────────────────────────────┤
│ Tab Filter                           │
│ [Semua] [Mahasiswa] [Staff] [Admin] │
├─────────────────────────────────────┤
│ Search Bar                           │
│ [🔍  Cari nama, NIM, email...]      │
├─────────────────────────────────────┤
│ Stats Summary                        │
│ Total: 150 | Aktif: 140 | Pending: 10│
├─────────────────────────────────────┤
│ User List                             │
│ ┌─────────────────────────────────┐ │
│ │ 👤 John Doe                     │ │
│ │    NIM: 12345678 | Aktif       │ │
│ │    john@university.ac | Modul   │ │
│ │    [⋯]                         │ │
│ └─────────────────────────────────┘ │
│ ┌─────────────────────────────────┐ │
│ │ 👤 Sarah Admin                  │ │
│ │    NIP: 98765432 | Aktif       │ │
│ │    sarah@university.ac | Admin  │ │
│ │    [⋯]                         │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Admin Bottom Navigation              │
└─────────────────────────────────────┘
```

## Features & Interactions

### 1. Header

| Element | Action |
|---------|--------|
| Back Button | Kembali |
| Title | "Manajemen User" |
| Search Button | Toggle search |
| Add Button | Navigate to add user form |

### 2. Tab Filter

Horizontal tabs for filtering by role:

| Tab | Role Value | Count Badge |
|-----|------------|-------------|
| Semua | `all` | Total users |
| Mahasiswa | `mahasiswa` | Student count |
| Staff | `staff` | Staff count |
| Admin | `admin` | Admin count |

### 3. Search Bar

- Placeholder: "Cari nama, NIM, atau email..."
- Search debounce: 300ms
- Clear button when text exists

### 4. Stats Summary

Quick stats row showing:
- Total Users
- Active Users
- Pending Approval

### 5. User List

**User Card Display:**

| Field | Value |
|-------|-------|
| Avatar | CircleAvatar with initial |
| Name | Full name |
| ID Number | NIM (students) / NIP (staff) |
| Email | User email |
| Role | Role badge |
| Status | Active/Pending/Inactive |

**Role Badges:**

| Role | Color | Text |
|------|-------|------|
| Admin | Primary (#4F46E5) | Admin |
| Helpdesk | Info (#3B82F6) | Helpdesk |
| Staff | Success (#10B981) | Staff |
| Mahasiswa | Gray (#6B7280) | Mahasiswa |

**Status Badges:**

| Status | Color |
|--------|-------|
| Aktif | Success (#10B981) |
| Pending | Warning (#F59E0B) |
| Nonaktif | Error (#EF4444) |

### 6. User Actions

Tap "more" button (⋮) on user card to show actions:

| Action | Icon | Description |
|--------|------|-------------|
| Lihat Detail | `visibility` | Navigate to user detail |
| Edit User | `edit` | Edit user data |
| Ubah Role | `badge` | Change user role |
| Reset Password | `lock_reset` | Send reset password |
| Nonaktifkan | `block` | Deactivate user account |
| Hapus | `delete` | Delete user (admin only) |

### 7. Add/Edit User Modal

```
┌─────────────────────────────────────┐
│ Tambah User                         │
├─────────────────────────────────────┤
│ Nama Lengkap:                       │
│ ┌─────────────────────────────────┐ │
│ │                                 │ │
│ └─────────────────────────────────┘ │
│                                     │
│ Email:                              │
│ ┌─────────────────────────────────┐ │
│ │                                 │ │
│ └─────────────────────────────────┘ │
│                                     │
│ NIM/NIP:                            │
│ ┌─────────────────────────────────┐ │
│ │                                 │ │
│ └─────────────────────────────────┘ │
│                                     │
│ Role:                               │
│ [Mahasiswa ▼]                       │
│                                     │
│        [Batal]  [Simpan]            │
└─────────────────────────────────────┘
```

### 8. User Detail Page

```
┌─────────────────────────────────────┐
│ [←] Detail User         [✏️] [⋮]   │
├─────────────────────────────────────┤
│ Profile Card                        │
│ ┌─────────────────────────────────┐ │
│ │     👤                         │ │
│ │     John Doe                   │ │
│ │     john@university.ac        │ │
│ │     [Mahasiswa] [Aktif]        │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ User Information                    │
│ ┌─────────────────────────────────┐ │
│ │ Nama:      John Doe             │ │
│ │ Email:     john@university.ac  │ │
│ │ NIM:       12345678             │ │
│ │ Jurusan:   Informatika          │ │
│ │ Role:      Mahasiswa            │ │
│ │ Status:    Aktif                │ │
│ │ Terdaftar: 15 Jan 2024          │ │
│ │ Login Ter: 20 Apr 2024, 10:00  │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Tiket yang Dibuat                    │
│ ┌─────────────────────────────────┐ │
│ │ #TK-001 | Reset Password        │ │
│ │ #TK-002 | Jadwal Ujian          │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Actions                             │
│ [Ubah Role] [Reset Password]        │
│ [Nonaktifkan]                       │
└─────────────────────────────────────┘
```

## States

### Loading State
- Skeleton cards
- Shimmer effect

### Empty State
```
┌─────────────────────────────────────┐
│                                     │
│        👤                          │
│                                     │
│    Tidak ada pengguna               │
│    yang ditemukan                   │
│                                     │
│    [Reset Pencarian]               │
│                                     │
└─────────────────────────────────────┘
```

### Error State
- "Gagal memuat data pengguna"
- Retry button

## Technical Requirements

### Navigation
- `/admin/users` - User list
- `/admin/users/:id` - User detail
- `/admin/users/add` - Add user form

### Query Parameters
```
/admin/users?role=mahasiswa&search=john
```

### Data Model
```dart
class User {
  String id;
  String name;
  String email;
  String nimNip;
  String role;          // admin, helpdesk, staff, mahasiswa
  String status;       // aktif, pending, nonaktif
  String? department;   // Jurusan/Unit
  DateTime createdAt;
  DateTime? lastLoginAt;
  int ticketCount;     // Number of tickets created
}
```

### API Endpoints (Mock)
- `GET /users` - Get all users
- `GET /users/:id` - Get single user
- `POST /users` - Create user
- `PUT /users/:id` - Update user
- `PUT /users/:id/role` - Change user role
- `PUT /users/:id/status` - Change user status
- `DELETE /users/:id` - Delete user
- `POST /users/:id/reset-password` - Send reset password email

### Permissions
| Action | Admin | Helpdesk | Staff |
|--------|-------|----------|-------|
| View Users | Yes | Yes | Limited |
| Add User | Yes | No | No |
| Edit User | Yes | Limited | No |
| Change Role | Yes | No | No |
| Delete User | Yes | No | No |
| Deactivate User | Yes | No | No |

## Dependencies

### Required Pages
- UserListPage
- UserDetailPage
- AddUserPage
- EditUserPage

### Required Widgets
- UserCard
- RoleBadge
- StatusBadge
- UserAvatar
- SearchBar
- FilterTabs
- ActionMenu
- UserDetailCard