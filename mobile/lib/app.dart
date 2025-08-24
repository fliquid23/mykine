import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/appointments/appointments_page.dart';

class MyKineApp extends StatelessWidget {
  const MyKineApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(routes: [
      GoRoute(path: '/', builder: (_, __) => const AppointmentsPage()),
    ]);

    return MaterialApp.router(
      title: 'MyKine',
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}
