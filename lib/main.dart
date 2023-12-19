import 'package:ai_assist/features/welcome/presentation/welcome_page.dart';
import 'package:flutter/material.dart';

import 'features/main/presentation/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
      routes: {
        '/welcomePage': (context) => const WelcomePage(),
        '/mainHomePage': (context) => MainPage(),
      },
    );
  }
}
