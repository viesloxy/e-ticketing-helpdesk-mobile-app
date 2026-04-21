# Admin/Helpdesk Feature Documentation

## Overview

Dokumentasi ini berisi spesifikasi fitur untuk role **Admin** dan **Helpdesk Staff** dalam aplikasi E-Ticketing Helpdesk. Fitur-fitur ini memungkinkan staff untuk mengelola dan merespons tiket yang diajukan oleh pengguna (mahasiswa/staff).

## Features

| # | Feature | Description |
|---|---------|-------------|
| 1 | [Admin Dashboard](01-admin-dashboard.md) | Halaman utama untuk overview statistik dan data penting |
| 2 | [Admin Ticket List](02-admin-ticket-list.md) | Daftar semua tiket dengan filter dan pencarian |
| 3 | [Admin Ticket Detail](03-admin-ticket-detail.md) | Detail tiket dengan fitur respond/balas |
| 4 | [Admin User Management](04-admin-user-management.md) | Manajemen data pengguna |
| 5 | [Admin Statistics](05-admin-statistics.md) | Laporan dan statistik tiket |
| 6 | [Admin Settings](06-admin-settings.md) | Pengaturan akun dan aplikasi |

## Navigation Structure

```
Admin Bottom Navigation:
├── Dashboard (Beranda)
├── Tiket (Daftar Tiket)
├── Notifikasi
└── Profil

Admin Top Navigation:
├── Search
├── Filter
└── Settings
```

## User Roles

| Role | Access Level |
|------|--------------|
| Admin | Full access ke semua fitur, termasuk user management |
| Helpdesk Staff | Akses ke ticket management dan response |

## Common UI Components

- [Admin Navigation Bar](07-admin-navigation.md)
- [Admin Status Badges](08-admin-badges.md)
- [Admin Data Tables](09-admin-tables.md)
- [Admin Forms](10-admin-forms.md)