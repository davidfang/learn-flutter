import 'route/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/app.dart';
import 'page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        ),
        // home: HomePage(),
        routes: route,
      ),
    );
  }
}
