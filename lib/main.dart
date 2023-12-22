import 'package:ai_assist/features/chatgpt/presentation/chatgpt_page.dart';
import 'package:ai_assist/features/dall/presentation/dall_e_page.dart';
import 'package:ai_assist/features/imagetotext/presentation/recognitionscreen.dart';
import 'package:ai_assist/features/voice/presentation/voiceAI_Page.dart';
import 'package:ai_assist/features/welcome/presentation/welcome_page.dart';
import 'package:flutter/material.dart';
import 'features/main/presentation/main_page.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'shared/side_bar_menu.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: 'AIzaSyCXPQO8bhZDi7c6qWfYKja9TrKr8nSmPp4',
  //     appId: '1:1020046637361:android:d07c9c7a5c33f91bc71810',
  //     messagingSenderId: '1020046637361',
  //     projectId: 'petroly-ai',
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const sideBarMenu = SideBarMenu(
      user: 'User',
      email: 'Example@email.com',
    );
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
        '/homePage': (context) => const MainPage(),
        '/chatGPT': (context) => const ChatGPT(),
        '/DALL-E': (context) => const Dall_E_Page(),
        '/ImageToText': (context) => const RecognitionScreen(),
        '/VoiceAIAssistant': (context) => const VoiceAI_Page(),
        '/logout': (context) => const WelcomePage(),
      },
    );
  }
}
