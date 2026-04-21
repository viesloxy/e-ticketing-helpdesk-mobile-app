import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../widgets/admin_ticket_card.dart';

class AdminTicketListPage extends StatefulWidget {
  const AdminTicketListPage({super.key});

  @override
  State<AdminTicketListPage> createState() => _AdminTicketListPageState();
}

class _AdminTicketListPageState extends State<AdminTicketListPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  String _selectedFilter = 'semua';
  bool _isLoading = false;
  bool _hasMore = true;

  final List<Map<String, dynamic>> _filters = [
    {'name': 'Semua', 'value': 'semua'},
    {'name': 'Baru', 'value': 'baru'},
    {'name': 'Ditangani', 'value': 'ditangani'},
    {'name': 'Diproses', 'value': 'diproses'},
    {'name': 'Selesai', 'value': 'selesai'},
  ];

  List<Map<String, dynamic>> _tickets = [];
  int _currentPage = 0;
  static const int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        _tickets = _getMockTickets(page: 0, pageSize: _pageSize);
        _currentPage = 0;
        _hasMore = _tickets.length >= _pageSize;
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMoreData() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      final newTickets = _getMockTickets(page: _currentPage + 1, pageSize: _pageSize);
      setState(() {
        _tickets.addAll(newTickets);
        _currentPage++;
        _hasMore = newTickets.length >= _pageSize;
        _isLoading = false;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMoreData();
    }
  }

  List<Map<String, dynamic>> _getMockTickets({required int page, required int pageSize}) {
    final allTickets = [
      {'ticketId': '#TK-2024-001', 'title': 'Permintaan reset password email kampus', 'category': 'Teknologi', 'status': 'diproses', 'date': '5 menit yang lalu', 'assignedTo': 'John Staff'},
      {'ticketId': '#TK-2024-002', 'title': 'Jadwal ujian semester genap 2024', 'category': 'Akademik', 'status': 'ditangani', 'date': '15 menit yang lalu', 'assignedTo': 'Sarah Admin'},
      {'ticketId': '#TK-2024-003', 'title': 'Kerusakan AC di ruang kelas L201', 'category': 'Fasilitas', 'status': 'baru', 'date': '30 menit yang lalu', 'assignedTo': null},
      {'ticketId': '#TK-2024-004', 'title': 'Pembayaran UKT semester baru', 'category': 'Keuangan', 'status': 'selesai', 'date': '1 jam yang lalu', 'assignedTo': 'Budi Staff'},
      {'ticketId': '#TK-2024-005', 'title': 'Peminjaman ruangan lab komputer', 'category': 'Akademik', 'status': 'diproses', 'date': '2 jam yang lalu', 'assignedTo': 'John Staff'},
      {'ticketId': '#TK-2024-006', 'title': 'Masalah koneksi internet di asrama', 'category': 'Teknologi', 'status': 'ditangani', 'date': '3 jam yang lalu', 'assignedTo': 'John Staff'},
      {'ticketId': '#TK-2024-007', 'title': 'Permintaan ATK untuk mengajar', 'category': 'Fasilitas', 'status': 'diproses', 'date': '4 jam yang lalu', 'assignedTo': 'Sarah Admin'},
      {'ticketId': '#TK-2024-008', 'title': 'Konfirmasi biaya semester tambahan', 'category': 'Keuangan', 'status': 'ditangani', 'date': '5 jam yang lalu', 'assignedTo': 'Budi Staff'},
      {'ticketId': '#TK-2024-009', 'title': 'Jadwal kuliah pengganti', 'category': 'Akademik', 'status': 'selesai', 'date': '6 jam yang lalu', 'assignedTo': 'John Staff'},
      {'ticketId': '#TK-2024-010', 'title': 'Perbaikan proyektor ruang 301', 'category': 'Teknologi', 'status': 'baru', 'date': '7 jam yang lalu', 'assignedTo': null},
    ];
    final start = page * pageSize;
    final end = start + pageSize;
    if (start >= allTickets.length) return [];
    return allTickets.sublist(start, end > allTickets.length ? allTickets.length : end);
  }

  List<Map<String, dynamic>> get _filteredTickets {
    var filtered = _tickets;
    if (_searchController.text.isNotEmpty) {
      filtered = filtered.where((t) =>
        t['title'].toString().toLowerCase().contains(_searchController.text.toLowerCase()) ||
        t['ticketId'].toString().toLowerCase().contains(_searchController.text.toLowerCase())
      ).toList();
    }
    if (_selectedFilter != 'semua') {
      filtered = filtered.where((t) => t['status'] == _selectedFilter).toList();
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: _buildAppBar(isWide),
          body: Column(
            children: [
              _buildFilterChips(isWide),
              Expanded(
                child: _filteredTickets.isEmpty && !_isLoading
                    ? _buildEmptyState()
                    : _buildTicketList(isWide),
              ),
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(bool isWide) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      title: _isSearchVisible
          ? TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Cari tiket...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: isWide ? 18 : 16),
              ),
              style: TextStyle(fontSize: isWide ? 18 : 16, color: AppColors.textPrimary),
              onChanged: (_) => setState(() {}),
            )
          : Text(
              'Daftar Tiket',
              style: TextStyle(fontSize: isWide ? 20 : 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(_isSearchVisible ? Icons.close : Icons.search, color: AppColors.textPrimary),
          onPressed: () {
            setState(() {
              _isSearchVisible = !_isSearchVisible;
              if (!_isSearchVisible) _searchController.clear();
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.filter_list, color: AppColors.textPrimary),
          onPressed: () => _showFilterModal(context),
        ),
      ],
    );
  }

  bool _isSearchVisible = false;

  Widget _buildFilterChips(bool isWide) {
    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? AppConstants.spacingXl : AppConstants.spacingLg,
        vertical: AppConstants.spacingMd,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _filters.map((filter) {
            final isSelected = _selectedFilter == filter['value'];
            return Padding(
              padding: const EdgeInsets.only(right: AppConstants.spacingSm),
              child: GestureDetector(
                onTap: () => setState(() => _selectedFilter = filter['value'] as String),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(horizontal: isWide ? 20 : 16, vertical: isWide ? 10 : 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.background,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
                  ),
                  child: Text(
                    filter['name'] as String,
                    style: TextStyle(
                      fontSize: isWide ? 14 : 13,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTicketList(bool isWide) {
    return RefreshIndicator(
      onRefresh: _loadInitialData,
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.all(isWide ? AppConstants.spacingXl : AppConstants.spacingLg),
        itemCount: _filteredTickets.length + (_hasMore ? 1 : 0),
        separatorBuilder: (context, index) => SizedBox(height: isWide ? AppConstants.spacingLg : AppConstants.spacingMd),
        itemBuilder: (context, index) {
          if (index >= _filteredTickets.length) {
            return Padding(
              padding: const EdgeInsets.all(AppConstants.spacingLg),
              child: Center(child: _isLoading ? const CircularProgressIndicator() : const SizedBox()),
            );
          }
          final ticket = _filteredTickets[index];
          return AdminTicketCard(
            ticketId: ticket['ticketId'] as String,
            title: ticket['title'] as String,
            category: ticket['category'] as String,
            status: ticket['status'] as String,
            date: ticket['date'] as String,
            assignedTo: ticket['assignedTo'] != null ? ticket['assignedTo'] as String : null,
            onTap: () => Navigator.pushNamed(context, '/admin/ticket-detail', arguments: ticket),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing2xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.description_outlined, size: 64, color: AppColors.textSecondary.withValues(alpha: 0.5)),
            const SizedBox(height: AppConstants.spacingLg),
            const Text('Tidak Ada Tiket', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            const SizedBox(height: AppConstants.spacingSm),
            const Text('Tiket yang sesuai filter akan muncul di sini', style: TextStyle(fontSize: 14, color: AppColors.textSecondary), textAlign: TextAlign.center),
            const SizedBox(height: AppConstants.spacing2xl),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedFilter = 'semua';
                  _searchController.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMedium)),
              ),
              child: const Text('Reset Filter'),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(AppConstants.spacingLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter Tiket', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            const SizedBox(height: AppConstants.spacingLg),
            const Text('Status', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
            const SizedBox(height: AppConstants.spacingMd),
            Wrap(
              spacing: AppConstants.spacingSm,
              runSpacing: AppConstants.spacingSm,
              children: _filters.map((filter) {
                final isSelected = _selectedFilter == filter['value'];
                return ChoiceChip(
                  label: Text(filter['name'] as String),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() => _selectedFilter = filter['value'] as String);
                    Navigator.pop(ctx);
                  },
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(color: isSelected ? Colors.white : AppColors.textPrimary),
                );
              }).toList(),
            ),
            const SizedBox(height: AppConstants.spacing2xl),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  setState(() => _selectedFilter = 'semua');
                  Navigator.pop(ctx);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radiusMedium)),
                ),
                child: const Text('Reset Filter'),
              ),
            ),
            const SizedBox(height: AppConstants.spacingLg),
          ],
        ),
      ),
    );
  }
}