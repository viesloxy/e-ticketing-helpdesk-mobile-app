import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/pages/login_page.dart';
import 'features/auth/pages/register_page.dart';
import 'features/home/pages/main_scaffold_page.dart';
import 'features/tickets/pages/create_ticket_page.dart';
import 'features/tickets/pages/ticket_detail_page.dart';
import 'features/tickets/pages/ticket_history_page.dart';
import 'features/notifications/pages/notifications_page.dart';
import 'features/admin/pages/admin_scaffold_page.dart';
import 'features/admin/dashboard/presentation/pages/admin_dashboard_page.dart';
import 'features/admin/tickets/presentation/pages/admin_ticket_list_page.dart';
import 'features/admin/tickets/presentation/pages/admin_ticket_detail_page.dart';
import 'features/admin/notifications/presentation/pages/admin_notifications_page.dart';
import 'features/admin/profile/presentation/pages/admin_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticketing Helpdesk',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        // User Routes
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const MainScaffoldPage(),
        '/create-ticket': (context) => const CreateTicketPage(),
        '/ticket-detail': (context) => const TicketDetailPage(),
        '/tickets': (context) => const TicketHistoryPage(),
        '/notifications': (context) => const NotificationsPage(),
        // Admin Routes
        '/admin': (context) => const AdminScaffoldPage(),
        '/admin/dashboard': (context) => const AdminDashboardPage(),
        '/admin/tickets': (context) => const AdminTicketListPage(),
        '/admin/ticket-detail': (context) => const AdminTicketDetailPage(),
        '/admin/notifications': (context) => const AdminNotificationsPage(),
        '/admin/profile': (context) => const AdminProfilePage(),
      },
    );
  }
}
