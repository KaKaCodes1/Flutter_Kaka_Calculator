import 'package:flutter/material.dart';
import 'package:kaka_calculator/screens/home_page.dart';
//import 'package:kaka_calculator/screens/home_page.dart';
// import 'package:kaka_calculator/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaKa Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 215, 185, 151)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

