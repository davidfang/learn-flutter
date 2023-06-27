import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mdc_101/home.dart';
import 'package:mdc_101/login.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const HomePage(),
      },
      theme: ThemeData(primaryColor: Colors.red),
    );
  }
}
