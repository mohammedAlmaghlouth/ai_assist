import 'package:ai_assist/features/auth/presentation/login_page.dart';
import 'package:ai_assist/features/auth/presentation/sign_up_page.dart';
import 'package:ai_assist/features/chatgpt/presentation/chatgpt_page.dart';
import 'package:ai_assist/features/dall/presentation/dall_e_page.dart';
import 'package:ai_assist/features/imagetotext/presentation/recognitionscreen.dart';
import 'package:ai_assist/features/voice/presentation/voiceAI_Page.dart';
import 'package:ai_assist/features/welcome/presentation/welcome_page.dart';
import 'package:flutter/material.dart';
import 'features/main/presentation/main_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Constants
const supabaseUrl = 'https://bovdbbactjouktgdkmvt.supabase.co';
const supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJvdmRiYmFjdGpvdWt0Z2RrbXZ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMyMzk3NDgsImV4cCI6MjAxODgxNTc0OH0.kPiervAtbvbdKXz9_uEMQpMO9dfLvNB9ehu_vn3yVoA";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MyApp());
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
        '/homePage': (context) => const MainPage(),
        '/chatGPT': (context) => const ChatGPT(),
        '/DALL-E': (context) => const Dall_E_Page(),
        '/ImageToText': (context) => const RecognitionScreen(),
        '/VoiceAIAssistant': (context) => const VoiceAI_Page(),
        '/logout': (context) => const WelcomePage(),
        '/signUpPage': (context) => SignUpPage(),
        '/loginPage': (context) => LoginPage(),
      },
    );
  }
}
