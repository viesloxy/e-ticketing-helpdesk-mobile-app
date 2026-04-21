# Admin Ticket List

## Overview

Halaman Daftar Tiket untuk Admin/Helpdesk yang menampilkan semua tiket yang masuk dengan fitur filter, pencarian, dan bulk actions. Admin dapat melihat, mencari, dan mengelola semua tiket dari halaman ini.

## Visual Design

### Color Palette

| Color | Hex Code | Usage |
|-------|----------|-------|
| Primary | `#4F46E5` | Buttons, active states |
| Background | `#F3F4F6` | Page background |
| Surface | `#FFFFFF` | Cards, list items |
| Text Primary | `#111827` | Headings |
| Text Secondary | `#6B7280` | Labels, timestamps |
| Border | `#E5E7EB` | Dividers, borders |

### Typography

| Element | Font | Size | Weight |
|---------|------|------|--------|
| Page Title | Inter | 20px | 600 |
| Ticket Title | Inter | 14px | 500 |
| Ticket ID | Inter | 12px | 400 |
| Caption | Inter | 12px | 400 |

## Layout Structure

```
┌─────────────────────────────────────┐
│ Header                              │
│ [←] Daftar Tiket        [🔍] [⚙️] │
├─────────────────────────────────────┤
│ Filter Chips (Horizontal)           │
│ [Semua] [Baru] [Ditangani] [Proses] │
│ [Selesai]                           │
├─────────────────────────────────────┤
│ Search Bar                          │
│ [🔍  Cari tiket...]                  │
├─────────────────────────────────────┤
│ Sort: [Terbaru ▼]  [📋] [⋮]        │
├─────────────────────────────────────┤
│ Ticket List                          │
│ ┌─────────────────────────────────┐ │
│ │ #TK-001 - Reset Password         │ │
│ │ Akademik | Baru | 10:00         │ │
│ │ John Doe (Mahasiswa)            │ │
│ │ [⚡ Tinggi]                      │ │
│ └─────────────────────────────────┘ │
│ ┌─────────────────────────────────┐ │
│ │ #TK-002 - AC Rusak              │ │
│ │ Fasilitas | Diproses | 14:30     │ │
│ │ Sarah (Admin)                   │ │
│ │ [📅 Sedang]                     │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Admin Bottom Navigation              │
└─────────────────────────────────────┘
```

## Features & Interactions

### 1. Header

| Element | Action |
|---------|--------|
| Back Button | Kembali ke halaman sebelumnya (jika dari external) |
| Title | "Daftar Tiket" |
| Search Button | Toggle search mode |
| Filter Button | Toggle filter modal |

### 2. Filter Chips

Horizontal scrollable chips untuk filter status:

| Chip | Status Value | Color |
|------|--------------|-------|
| Semua | `all` | Neutral |
| Baru | `baru` | Warning (#F59E0B) |
| Ditangani | `ditangani` | Info (#3B82F6) |
| Diproses | `diproses` | Primary (#4F46E5) |
| Selesai | `selesai` | Success (#10B981) |
| Ditolak | `ditolak` | Error (#EF4444) |

**Interaction:**
- Tap chip → Filter list berdasarkan status
- Active chip memiliki background solid

### 3. Search Bar

**Default State:**
- Collapsed, shows only search icon in header

**Active State:**
- Full-width text field
- Auto-focus
- "Cari tiket..." placeholder
- Clear button (X) when text exists

**Search Behavior:**
- Search by: Ticket ID, Title, Description, Creator Name
- Debounce: 300ms
- Clear search: X button or cancel

### 4. Sort & View Options

| Option | Values |
|--------|--------|
| Sort By | Tanggal, Prioritas, Status |
| Order | Terbaru, Terlama |
| View | List, Grid (future) |

**Interaction:**
- Tap sort dropdown → Show sort options
- Tap view toggle → Toggle between list/grid

### 5. Bulk Actions

When user long-presses a ticket, enters selection mode:

| Action | Icon | Description |
|--------|------|-------------|
| Select All | `✓` | Select all visible tickets |
| Assign | `person` | Assign to staff |
| Mark Done | `✓` | Mark as completed |
| Delete | `🗑` | Delete selected |

### 6. Ticket List Item

Each ticket card displays:

| Field | Value |
|-------|-------|
| Ticket ID | Format: #TK-YYYY-NNN |
| Title | Max 2 lines, ellipsis overflow |
| Category | Badge with icon |
| Status | Status badge |
| Time | "X waktu yang lalu" |
| Assigned To | Staff name or "Belum ditugaskan" |
| Priority | High/Medium/Low badge |

**Ticket Card States:**
- Default: White background
- Selected: Light primary background + checkmark
- Swiped: Reveal quick actions

**Interactions:**
- Tap → Navigate to `/admin/ticket/:id`
- Long press → Enter selection mode
- Swipe left → Quick respond/assign

### 7. Empty State

```
┌─────────────────────────────────────┐
│                                     │
│        📋                          │
│                                     │
│    Tidak ada tiket                  │
│    yang sesuai filter               │
│                                     │
│    [Reset Filter]                   │
│                                     │
└─────────────────────────────────────┘
```

### 8. Pull to Refresh

- Visual: CircularProgressIndicator at top
- Behavior: Fetch latest data from API

### 9. Pagination

- Infinite scroll
- Load more when 80% scrolled
- Loading indicator at bottom

## Technical Requirements

### Navigation
- `/admin/tickets` - Main ticket list
- `/admin/ticket/:id` - Ticket detail

### Query Parameters
```
/admin/tickets?status=baru&category=teknologi&search=password
```

### Data Model
```dart
class Ticket {
  String id;
  String ticketId;        // Format: #TK-YYYY-NNN
  String title;
  String description;
  String category;        // akademik, teknologi, fasilitas, keuangan, lainnya
  String status;          // baru, ditangani, diproses, selesai, ditolak
  String priority;        // tinggi, sedang, rendah
  String createdBy;       // User ID
  String createdByName;
  String? assignedTo;      // Staff ID
  String? assignedToName;
  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? completedAt;
  List<String> attachments;
}
```

### Filter Options
```dart
{
  status: ['all', 'baru', 'ditangani', 'diproses', 'selesai', 'ditolak'],
  category: ['all', 'akademik', 'teknologi', 'fasilitas', 'keuangan', 'lainnya'],
  priority: ['all', 'tinggi', 'sedang', 'rendah'],
  assignee: ['all', 'me', 'unassigned'],
  dateRange: { start: DateTime, end: DateTime }
}
```

### API Endpoints (Mock)
- `GET /tickets` - Get all tickets with filters
- `GET /tickets/:id` - Get single ticket
- `POST /tickets/:id/assign` - Assign ticket
- `POST /tickets/:id/status` - Update ticket status
- `DELETE /tickets/:id` - Delete ticket

### State Management
- Filter state: Managed locally with setState
- Ticket list: Could use Provider/Riverpod (future)
- Search: Debounced text field

## Dependencies

### Required Pages
- TicketListPage
- TicketDetailPage
- AssignStaffPage (modal)

### Required Widgets
- FilterChip
- TicketCard
- SearchBar
- SortDropdown
- EmptyState
- LoadingIndicator