import 'package:ai_assist/features/chatgpt/presentation/chatgpt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_assist/features/chatgpt/data/openai_api.dart';
import 'package:ai_assist/features/chatgpt/data/users.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:ai_assist/main.dart'; // Assuming this is where ChatGPT is included

void main() {
  // to test ChatGpt page
  testWidgets('ChatGPT Page Test', (WidgetTester tester) async {
    // Build the ChatGPT page and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: ChatGPT()));

    // Verify if the AppBar with the title 'AI-ASSIST GPT' is present.
    expect(find.text('AI-ASSIST GPT'), findsOneWidget);

    // Find the message input field.
    final Finder messageInputField = find.byType(TextField);
    expect(messageInputField, findsOneWidget);

    // Enter a message.
    await tester.enterText(messageInputField, 'Hello, ChatGPT!');
    await tester.pumpAndSettle();

    // Tap the send button and trigger a frame.
    final Finder sendButton =
        find.widgetWithIcon(FloatingActionButton, Icons.send);
    await tester.tap(sendButton);
    await tester.pumpAndSettle();

    // Verify if the message is added to the chat
    expect(find.text('Hello, ChatGPT!'), findsOneWidget);
  });
}
