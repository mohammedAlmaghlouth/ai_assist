import 'package:ai_assist/features/chatgpt/presentation/chatgpt_page.dart';
import 'package:ai_assist/features/imagetotext/presentation/recognitionscreen.dart';
import 'package:ai_assist/features/voice/presentation/voiceAI_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_assist/features/dall/presentation/dall_e_page.dart';
import 'package:ai_assist/main.dart'; // Update with actual imports

void main() {
  // Tests for ChatGPT Page
  group('ChatGPT Page Tests', () {
    testWidgets('ChatGPT Page Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ChatGPT()));
      expect(find.text('AI-ASSIST GPT'), findsOneWidget);
    });
  });

  // Tests for Dall_E_Page
  group('Dall_E_Page Tests', () {
    testWidgets('Dropdown Selection Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Dall_E_Page()));
      Finder dropdownButton = find.byType(DropdownButton);
      await tester.tap(dropdownButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Medium').last);
      await tester.pumpAndSettle();
      expect(find.text('Medium'), findsOneWidget);
    });
  });

  // Tests for VoiceAI_Page
  group('VoiceAI_Page Tests', () {
    testWidgets('VoiceAI Initialization Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: VoiceAI_Page()));
    });
  });

  // Tests for RecognitionScreen
  group('RecognitionScreen Tests', () {
    testWidgets('Image Selection Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RecognitionScreen()));
    });
  });
}