# Admin Ticket Detail

## Overview

Halaman Detail Tiket untuk Admin/Helpdesk yang menampilkan informasi lengkap tiket beserta fitur untuk membalas, mengubah status, dan assigning tiket ke staff.

## Visual Design

### Color Palette

| Color | Hex Code | Usage |
|-------|----------|-------|
| Primary | `#4F46E5` | Buttons, links |
| Background | `#F3F4F6` | Page background |
| Surface | `#FFFFFF` | Cards, containers |
| Text Primary | `#111827` | Headings |
| Text Secondary | `#6B7280` | Labels |
| Border | `#E5E7EB` | Dividers |

### Typography

| Element | Font | Size | Weight |
|---------|------|------|--------|
| Ticket ID | Inter | 14px | 500 |
| Title | Inter | 18px | 600 |
| Section Title | Inter | 16px | 600 |
| Body Text | Inter | 14px | 400 |
| Caption | Inter | 12px | 400 |

## Layout Structure

```
┌─────────────────────────────────────┐
│ App Bar                             │
│ [←] #TK-2024-001      [📤] [⋮]     │
├─────────────────────────────────────┤
│ Ticket Header Card                  │
│ ┌─────────────────────────────────┐ │
│ │ Permintaan Reset Password       │ │
│ │ [Akademik] [Baru] [⚡ Tinggi]   │ │
│ │ Dibuat: 21 Jan 2024, 10:00     │ │
│ │ Kategori: Teknologi             │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Status Timeline                     │
│ ┌─────────────────────────────────┐ │
│ │ ✓ Tiket Dibuat     10:00       │ │
│ │ ● Ditangani         10:15       │ │
│ │ ○ Diproses          -           │ │
│ │ ○ Selesai           -           │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Ticket Details                      │
│ ┌─────────────────────────────────┐ │
│ │ Pembuat:    John Doe (Mahasiswa)│ │
│ │ Email:      john@university.ac  │ │
│ │ Prioritas:  Tinggi              │ │
│ │ Ditugaskan: Sarah (Admin)       │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Description                          │
│ ┌─────────────────────────────────┐ │
│ │ Deskripsi lengkap tiket...     │ │
│ │                                 │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Attachments                         │
│ ┌─────────────────────────────────┐ │
│ │ 📎 Screenshot_error.png (1.2MB)│ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Conversation / Chat                  │
│ ┌─────────────────────────────────┐ │
│ │ [Staff] Sarah: Mohon tunggu... │ │
│ │ [Anda]  : Terima kasih         │ │
│ │ [Staff] Sarah: Password sudah  │ │
│ │          direset...             │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Action Buttons                       │
│ ┌─────────────────────────────────┐ │
│ │ [Ubah Status ▼] [Tugaskan ▼]   │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Message Input                        │
│ [ 📎 ] [ Ketik pesan...      ] [➤] │
└─────────────────────────────────────┘
```

## Features & Interactions

### 1. App Bar

| Element | Action |
|---------|--------|
| Back Button | Kembali ke daftar tiket |
| Title | Ticket ID (#TK-YYYY-NNN) |
| Share | Share ticket info |
| More Menu | Edit, Delete, Print |

### 2. Ticket Header Card

Displays primary ticket information:
- Title (max 2 lines)
- Category badge
- Status badge
- Priority badge
- Created timestamp

### 3. Status Timeline

Visual representation of ticket lifecycle:

| Status | Icon | Color |
|--------|------|-------|
| Tiket Dibuat | ✓ (check) | Success (#10B981) |
| Ditangani | ✓ (check) | Success (#10B981) |
| Diproses | ○ (filled circle) | Primary (#4F46E5) |
| Selesai | ○ (empty circle) | Border (#E5E7EB) |

**Visual:**
- Filled icon + connecting line = Completed
- Filled icon + no line = Current
- Empty icon = Pending

**Interaction:**
- Admin can move status forward only (no backward movement)

### 4. Ticket Details Section

Grid layout showing:

| Field | Value | Editable |
|-------|-------|----------|
| Pembuat | User name + role | No |
| Email | User email | No |
| Prioritas | High/Medium/Low | Yes |
| Ditugaskan | Staff name | Yes |
| Tanggal Dibuat | DateTime | No |
| Tanggal Update | DateTime | No |

**Interaction:**
- Tap priority → Dropdown to change
- Tap "Ditugaskan" → Staff selection modal

### 5. Description Section

- Expandable text
- Full description text
- Copy button

### 6. Attachments Section

| Element | Description |
|---------|-------------|
| File Icon | Based on file type |
| File Name | Original filename |
| File Size | Human readable |
| Download Button | Save to device |

**Supported Types:**
- Images: .jpg, .png, .gif
- Documents: .pdf, .doc, .docx
- Max size: 5MB per file

### 7. Conversation Section

Chat-style interface for communication:

**Message Bubble (Staff):**
- Left aligned
- White background
- Staff name + timestamp

**Message Bubble (User):**
- Right aligned
- Primary color background
- White text
- User name + timestamp

**Interaction:**
- Scroll to load more messages
- Pull to refresh
- Load more on scroll

### 8. Quick Actions Bar

| Button | Action |
|--------|--------|
| Ubah Status | Dropdown: Ditangani, Diproses, Selesai, Ditolak |
| Tugaskan | Modal: Select staff from list |

### 9. Message Input

| Element | Description |
|---------|-------------|
| Attach Button | Add attachment to message |
| Text Field | Multi-line input |
| Send Button | Send message |
| Character Count | X/500 |

**Validation:**
- Empty message: disabled send
- Max 500 characters

**Interaction:**
- Tap send → Add message to conversation
- Keyboard auto-adjust

### 10. Action Modals

#### Ubah Status Modal
```
┌─────────────────────────────────────┐
│ Ubah Status                         │
├─────────────────────────────────────┤
│ ○ Ditangani                         │
│ ● Diproses                          │
│ ○ Selesai                           │
│ ○ Ditolak                           │
├─────────────────────────────────────┤
│ Catatan (opsional):                 │
│ ┌─────────────────────────────────┐ │
│ │                                 │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│        [Batal]  [Simpan]            │
└─────────────────────────────────────┘
```

#### Tugaskan Modal
```
┌─────────────────────────────────────┐
│ Tugaskan ke Staff                   │
├─────────────────────────────────────┤
│ 🔍 Cari staff...                    │
├─────────────────────────────────────┤
│ ○ Sarah (Admin) - Available        │
│ ○ Budi (Helpdesk) - Available      │
│ ● John (Helpdesk) - On Leave      │
├─────────────────────────────────────┤
│        [Batal]  [Tugaskan]         │
└─────────────────────────────────────┘
```

## States

### Loading State
- Skeleton for all sections
- Disabled action buttons

### Error State
- "Gagal memuat detail tiket"
- Retry button

### Empty States
- No description: "Tidak ada deskripsi"
- No attachment: "Tidak ada lampiran"
- No conversation: "Belum ada percakapan"

### Success States
- Message sent: Brief checkmark animation
- Status updated: Snackbar confirmation
- Ticket assigned: Snackbar confirmation

## Technical Requirements

### Navigation
- `/admin/tickets` - Back route
- `/admin/ticket/:id` - This page

### Data Model
```dart
class TicketDetail {
  String id;
  String ticketId;
  String title;
  String description;
  String category;
  String status;
  String priority;
  User creator;
  User? assignee;
  List<Attachment> attachments;
  List<Conversation> conversations;
  List<TicketStatusHistory> statusHistory;
  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? completedAt;
}

class Conversation {
  String id;
  String senderId;
  String senderName;
  String senderRole; // 'staff' or 'user'
  String message;
  DateTime timestamp;
  Attachment? attachment;
}

class TicketStatusHistory {
  String status;
  DateTime timestamp;
  String changedBy;
  String? note;
}
```

### API Endpoints (Mock)
- `GET /tickets/:id` - Get ticket detail
- `POST /tickets/:id/conversation` - Send message
- `PUT /tickets/:id/status` - Update status
- `PUT /tickets/:id/assign` - Assign ticket

### Actions
1. **Update Status**
   - Validate new status is forward progression
   - Add to status history
   - Send notification to user

2. **Send Message**
   - Add to conversation
   - Send notification to user
   - Update ticket updatedAt

3. **Assign Ticket**
   - Update assignee
   - Send notification to assigned staff
   - Update ticket updatedAt

## Dependencies

### Required Widgets
- TicketHeaderCard
- StatusTimeline
- DetailRow
- ConversationBubble
- MessageInput
- ActionDropdown
- StaffSelectorModal
- StatusChangeModal