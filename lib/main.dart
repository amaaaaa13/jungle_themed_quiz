// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const JungleQuizApp());
}

class JungleQuizApp extends StatelessWidget {
  const JungleQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
    );
  }
}
