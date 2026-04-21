import 'package:flutter/material.dart';
import '../../../shared/navigation/bottom_nav_bar.dart';
import '../presentation/pages/home_page.dart';
import '../../tickets/pages/ticket_history_page.dart';
import '../../notifications/presentation/pages/notifications_page.dart';
import '../../profile/presentation/pages/profile_page.dart';

class MainScaffoldPage extends StatefulWidget {
  const MainScaffoldPage({super.key});

  @override
  State<MainScaffoldPage> createState() => _MainScaffoldPageState();
}

class _MainScaffoldPageState extends State<MainScaffoldPage> {
  int _currentIndex = 0;

  // Page indices: 0=Home, 1=Tiket, 2=Notifikasi, 3=Profil
  // These map to bottom nav indices: 0, 1, 3, 4
  final List<Widget> _pages = [
    const HomePage(),
    const TicketHistoryPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  // Convert page index to nav bar index
  int get _navIndex {
    switch (_currentIndex) {
      case 0: return 0; // Home
      case 1: return 1; // Tiket Saya
      case 2: return 3; // Notifikasi
      case 3: return 4; // Profil
      default: return 0;
    }
  }

  void _navigateToCreateTicket() {
    Navigator.pushNamed(context, '/create-ticket');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _navIndex,
        onTap: (index) {
          if (index == 2) {
            // Create Ticket - navigate using named route for full screen
            _navigateToCreateTicket();
          } else if (index == 0) {
            setState(() => _currentIndex = 0);
          } else if (index == 1) {
            setState(() => _currentIndex = 1);
          } else if (index == 3) {
            setState(() => _currentIndex = 2);
          } else if (index == 4) {
            setState(() => _currentIndex = 3);
          }
        },
      ),
    );
  }
}
