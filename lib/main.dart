import 'package:flutter/material.dart';
import 'splash_screan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player UI',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1C1B29),
        primaryColor: const Color(0xFF6F35A5),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
