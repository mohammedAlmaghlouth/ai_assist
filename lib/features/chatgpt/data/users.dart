// create current user
import 'package:dash_chat_2/dash_chat_2.dart';

final ChatUser currentUser =
    ChatUser(id: '1', firstName: 'Mohammed', lastName: 'AlMaghlouth');
// create gpt user
final ChatUser gptChatUser =
    ChatUser(id: '2', firstName: 'AI-ASSIST', lastName: 'GPT');

// messages
List<ChatMessage> messages = <ChatMessage>[];
