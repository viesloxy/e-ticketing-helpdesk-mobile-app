import 'package:flutter/material.dart';
import '../widgets/admin_bottom_nav_bar.dart';
import '../dashboard/presentation/pages/admin_dashboard_page.dart';
import '../tickets/presentation/pages/admin_ticket_list_page.dart';
import '../notifications/presentation/pages/admin_notifications_page.dart';
import '../profile/presentation/pages/admin_profile_page.dart';

class AdminScaffoldPage extends StatefulWidget {
  const AdminScaffoldPage({super.key});

  @override
  State<AdminScaffoldPage> createState() => _AdminScaffoldPageState();
}

class _AdminScaffoldPageState extends State<AdminScaffoldPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AdminDashboardPage(),
    const AdminTicketListPage(),
    const AdminNotificationsPage(),
    const AdminProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AdminBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        notificationCount: 5,
      ),
    );
  }
}