import 'package:ai_assist/shared/openai_api.dart';
import 'package:ai_assist/features/chatgpt/data/users.dart';
import 'package:ai_assist/shared/side_bar_menu.dart';
import 'package:ai_assist/shared/utils.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  // init open AI Object
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  // message colors
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'AI-ASSIST GPT',
          style: textStyle(
            size: 20,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      drawer: SideBarMenu(
        user: 'User',
        email: 'Example@email.com',
      ),
      body: DashChat(
        currentUser: currentUser,
        messageOptions: MessageOptions(
            currentUserTextColor: Theme.of(context).colorScheme.onSecondaryContainer,
            currentUserContainerColor: Theme.of(context).colorScheme.inversePrimary,
            containerColor: Theme.of(context).colorScheme.secondaryContainer,
            textColor: Theme.of(context).colorScheme.onSecondaryContainer),
        onSend: (ChatMessage message) {
          getChatResponse(message);
        },
        messages: messages,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage message) async {
    // print(message.text);
    setState(() {
      messages.insert(0, message);
    });
    List<Messages> messagesHistory = messages.reversed.map((message) {
      // reversed beacause that how messages appears
      if (message.user == currentUser) {
        return Messages(role: Role.user, content: message.text);
      } else {
        return Messages(role: Role.assistant, content: message.text);
      }
    }).toList();
    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      // here I select this model, because its fast and cheap
      messages: messagesHistory,
      maxToken: 250,
    ); // here token set to maximum 250, because its a trail project - unreleased.
    final response = await _openAI.onChatCompletion(request: request);
    // here to insert messages from gpt, if there is any (!=null)
    for (var elem in response!.choices) {
      if (elem.message != null) {
        // there is a message
        setState(() {
          messages.insert(
              0,
              ChatMessage(
                  user: gptChatUser,
                  createdAt: DateTime.now(),
                  text: elem.message!.content));
        });
      }
    }
  }
}
