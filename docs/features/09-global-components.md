# Komponen Global

## Deskripsi
Dokumen ini mendefinisikan komponen UI global yang digunakan secara konsisten di seluruh aplikasi.

---

## Bottom Navigation Bar

### Deskripsi
Bottom navigation adalah menu navigasi utama yang selalu terlihat di bagian bawah layar.

### Tab Items
| Tab | Ikon Active | Ikon Inactive | Label |
|-----|-------------|---------------|-------|
| Beranda | home | home-outline | Beranda |
| Tiket Saya | document-text | document-text-outline | Tiket |
| Buat | add-circle | add-circle-outline | Buat |
| Notifikasi | notifications | notifications-outline | Notifikasi |
| Profil | person | person-outline | Profil |

### Badge Counter
- Notifikasi badge: angka merah di atas tab Notifikasi
- Max display: "9+"

### Design
| Property | Value |
|----------|-------|
| Height | 64px |
| Background | White |
| Shadow | 0 -1px 3px rgba(0,0,0,0.1) |
| Active Color | #2563EB (Primary) |
| Inactive Color | #6B7280 (Gray) |
| Icon Size | 24px |
| Label Size | 11px |
| Border Radius Top | 0px |

### States
- **Active**: Icon filled + primary color + label bold
- **Inactive**: Icon outline + gray color + label regular
- **With Badge**: Red circle dengan angka

---

## Status Badge

### Variants
| Status | Background | Text | Icon |
|--------|------------|------|------|
| baru | #FEF3C7 | #92400E | time-outline |
| ditangani | #DBEAFE | #1E40AF | checkmark-outline |
| diproses | #E0E7FF | #3730A3 | refresh-outline |
| selesai | #D1FAE5 | #065F46 | checkmark-circle |
| dibatalkan | #FEE2E2 | #991B1B | close-outline |

### Design
| Property | Value |
|----------|-------|
| Padding | 4px 8px |
| Border Radius | 6px |
| Font Size | 11px |
| Font Weight | 500 (Medium) |
| Icon Size | 12px |
| Gap | 4px |

---

## Category Badge

### Variants
| Kategori | Background | Text | Icon |
|----------|------------|------|------|
| Akademik | #FEF3C7 | #92400E | book-outline |
| Teknologi | #DBEAFE | #1E40AF | laptop-outline |
| Fasilitas | #FCE7F3 | #9D174D | business-outline |
| Keuangan | #D1FAE5 | #065F46 | card-outline |
| Lainnya | #E5E7EB | #374151 | ellipsis-horizontal-outline |

### Design
| Property | Value |
|----------|-------|
| Padding | 4px 8px |
| Border Radius | 6px |
| Font Size | 11px |
| Font Weight | 500 (Medium) |
| Icon Size | 12px |
| Gap | 4px |

---

## Priority Badge

### Variants
| Priority | Background | Text |
|----------|------------|------|
| Rendah | #D1FAE5 | #065F46 |
| Sedang | #FEF3C7 | #92400E |
| Tinggi | #FEE2E2 | #991B1B |

### Design
| Property | Value |
|----------|-------|
| Padding | 4px 8px |
| Border Radius | 6px |
| Font Size | 11px |
| Font Weight | 500 (Medium) |

---

## Button Component

### Variants
| Variant | Background | Text | Border |
|---------|------------|------|--------|
| Primary | #2563EB | White | None |
| Secondary | White | #2563EB | 1px #2563EB |
| Danger | #EF4444 | White | None |
| Ghost | Transparent | #6B7280 | None |
| Disabled | #E5E7EB | #9CA3AF | None |

### Sizes
| Size | Height | Padding | Font Size |
|------|--------|---------|-----------|
| Small | 36px | 12px 16px | 14px |
| Medium | 44px | 14px 20px | 16px |
| Large | 52px | 16px 24px | 16px |
| Full | 48px | 14px | 16px |

### States
| State | Opacity/Effect |
|-------|----------------|
| Default | 100% |
| Hover/Pressed | scale(0.98) + darker bg |
| Loading | Spinner + disabled |
| Disabled | 50% opacity |

### Design
| Property | Value |
|----------|-------|
| Border Radius | 12px |
| Font Weight | 600 (SemiBold) |
| Transition | 100ms ease |

---

## Input Field Component

### Variants
| Variant | Background | Border |
|---------|------------|--------|
| Default | #F9FAFB | #E5E7EB |
| Focused | White | #2563EB (2px) |
| Error | White | #EF4444 (2px) |
| Disabled | #F3F4F6 | #E5E7EB |

### Design
| Property | Value |
|----------|-------|
| Height | 48px |
| Padding | 14px 16px |
| Border Radius | 12px |
| Font Size | 16px |
| Label Size | 14px |
| Label Weight | 500 |
| Placeholder Color | #9CA3AF |
| Border | 1px |
| Focus Ring | 0 0 0 3px rgba(37, 99, 235, 0.1) |

### Icon Position
- Leading icon: 16px from left
- Trailing icon: 16px from right

---

## Card Component

### Design
| Property | Value |
|----------|-------|
| Background | White |
| Border Radius | 16px |
| Padding | 16px |
| Shadow | 0 1px 3px rgba(0,0,0,0.1) |
| Shadow Pressed | 0 1px 2px rgba(0,0,0,0.05) |

---

## Toast/Snackbar

### Variants
| Type | Background | Icon |
|------|------------|------|
| Success | #065F46 | checkmark-circle |
| Error | #991B1B | close-circle |
| Info | #1E40AF | information-circle |
| Warning | #92400E | warning |

### Design
| Property | Value |
|----------|-------|
| Position | Bottom, 16px from nav |
| Background | Text Primary |
| Text Color | White |
| Border Radius | 12px |
| Padding | 14px 16px |
| Max Width | screen - 32px |
| Icon Size | 20px |
| Gap | 8px |

### Animation
- Appear: slide up + fade, 300ms
- Auto dismiss: 3 seconds
- Dismiss: slide down + fade, 200ms

---

## Loading Indicator

### Spinner
| Property | Value |
|----------|-------|
| Size | 24px (default), 16px (small), 40px (large) |
| Stroke Width | 2px |
| Color | Primary |
| Animation | rotate 360deg, 1s, linear, infinite |

### Skeleton
| Property | Value |
|----------|-------|
| Background | #E5E7EB |
| Shimmer | linear-gradient 90deg, #E5E7EB, #F3F4F6, #E5E7EB |
| Animation | shimmer 1.5s, infinite |
| Border Radius | 8px |

### Progress Bar
| Property | Value |
|----------|-------|
| Height | 4px |
| Background | #E5E7EB |
| Fill Color | Primary |
| Border Radius | 2px |
| Animation | width transition 300ms |

---

## Empty State

### Design
| Property | Value |
|----------|-------|
| Icon Size | 64px |
| Icon Color | #D1D5DB |
| Title Size | 18px |
| Title Weight | 600 |
| Title Color | Text Primary |
| Description Size | 14px |
| Description Color | Text Secondary |
| Spacing | 16px between elements |
| CTA Button | Primary variant |

---

## Avatar Component

### Sizes
| Size | Diameter | Font Size |
|------|----------|-----------|
| Small | 32px | 12px |
| Medium | 40px | 14px |
| Large | 64px | 24px |
| XLarge | 80px | 32px |

### Design
| Property | Value |
|----------|-------|
| Border Radius | 50% |
| Background | Light Blue #EFF6FF |
| Text Color | Primary Blue |
| Font Weight | 600 |

### Fallback
- Initial letters dari nama (max 2)
- Jika ada foto: tampilkan foto

---

## Modal/Dialog

### Confirmation Dialog
| Property | Value |
|----------|-------|
| Background | White |
| Border Radius | 16px |
| Padding | 24px |
| Max Width | 320px |
| Overlay | rgba(0, 0, 0, 0.5) |
| Icon Size | 48px |

### Design
| Property | Value |
|----------|-------|
| Title Size | 18px |
| Title Weight | 600 |
| Message Size | 14px |
| Button Gap | 12px |

### Animation
- Overlay: fade in, 200ms
- Modal: scale(0.95) + fade, 200ms

---

## Color Palette

### Primary Colors
| Name | Hex | Usage |
|------|-----|-------|
| Primary 50 | #EFF6FF | Light backgrounds |
| Primary 100 | #DBEAFE | Hover states |
| Primary 500 | #2563EB | Main primary |
| Primary 600 | #1D4ED8 | Hover |
| Primary 700 | #1E40AF | Active/Pressed |

### Neutral Colors
| Name | Hex | Usage |
|------|-----|-------|
| Gray 50 | #F9FAFB | Backgrounds |
| Gray 100 | #F3F4F6 | Borders, disabled |
| Gray 200 | #E5E7EB | Dividers |
| Gray 300 | #D1D5DB | Placeholder |
| Gray 400 | #9CA3AF | Secondary text |
| Gray 500 | #6B7280 | Icons, labels |
| Gray 600 | #4B5563 | Body text |
| Gray 700 | #374151 | Headings |
| Gray 800 | #1F2937 | Primary text |
| Gray 900 | #111827 | Titles |

### Semantic Colors
| Name | Hex | Usage |
|------|-----|-------|
| Success | #10B981 | Success states |
| Warning | #F59E0B | Warning states |
| Error | #EF4444 | Error states |
| Info | #3B82F6 | Info states |

---

## Typography

### Font Family
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
```

### Google Fonts Import
```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

### Scale
| Style | Size | Weight | Line Height |
|-------|------|--------|-------------|
| H1 | 32px | 700 | 40px |
| H2 | 24px | 700 | 32px |
| H3 | 20px | 600 | 28px |
| H4 | 18px | 600 | 24px |
| Body Large | 16px | 400 | 24px |
| Body | 14px | 400 | 20px |
| Caption | 12px | 400 | 16px |
| Overline | 11px | 500 | 16px |
