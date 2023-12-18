import 'package:ai_assist/features/chatgpt/application/gpt.dart';
import 'package:ai_assist/features/chatgpt/data/users.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  Color primary = const Color.fromARGB(202, 88, 12, 88);
  Color secondry = const Color.fromARGB(255, 96, 96, 96);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: const Text(
            'AI-ASSIST GPT',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: DashChat(
          currentUser: currentUser,
          messageOptions: MessageOptions(
              currentUserContainerColor: primary,
              containerColor: secondry,
              textColor: Colors.white),
          onSend: (ChatMessage message) {
            getChatResponse(message); // call the function at application layer
          },
          messages: messages,
        ));
  }

  Future<void> getChatResponse(ChatMessage message) async {
    // print(message.text);
    setState(() {
      messages.insert(0, message);
    });
  }
}
