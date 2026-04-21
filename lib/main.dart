import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/pages/login_page.dart';

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
        '/login': (context) => const LoginPage(),
        // Tambahkan route lain di sini
        '/home': (context) => const Scaffold(
              body: Center(
                child: Text('Home Page - Coming Soon'),
              ),
            ),
        '/register': (context) => const Scaffold(
              body: Center(
                child: Text('Register Page - Coming Soon'),
              ),
            ),
      },
    );
  }
}
