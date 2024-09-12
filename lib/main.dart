import 'package:flutter/material.dart';
import 'package:pokemon/screens.dart/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokemon',
        debugShowCheckedModeBanner: debugDisableShadows,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 51, 134, 176)),
          useMaterial3: true,
        ),
        home: const HomeScreen());
  }
}
