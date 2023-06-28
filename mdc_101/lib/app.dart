import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mdc_101/home.dart';
import 'package:mdc_101/login.dart';

import 'color.dart';

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
      theme: _kShrineTheme,
      // theme: ThemeData(primaryColor: Colors.red),
      // theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
    );
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
          primary: kShrinePink100,
          onPrimary: kShrineBrown900,
          secondary: kShrineBrown900,
          error: kShrineErrorRed),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: kShrineBrown900)),
          floatingLabelStyle: TextStyle(color: kShrineBrown900)));
}
