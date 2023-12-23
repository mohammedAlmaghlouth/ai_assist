import 'package:ai_assist/main.dart';
import 'package:ai_assist/shared/side_bar_menu.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'featurBox.dart';
import 'welcomingStatment.dart';
import 'virtualAssisstantProfile.dart';
import '../application/openai_service.dart';

class VoiceAI_Page extends StatefulWidget {
  final SideBarMenu sideBarMenu;

  const VoiceAI_Page({super.key, required this.sideBarMenu});

  @override
  State<VoiceAI_Page> createState() => _VoiceAI_PageState();
}

class _VoiceAI_PageState extends State<VoiceAI_Page> {
  final String title = 'Voice AI Assistant';
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // leading: const Icon(Icons.menu_rounded),
        actions: [
          TextButton(
            onPressed: () async {
              setState(() {
                lastWords = '';
                openAIService = OpenAIService();
                generatedContent = null;
                generatedImageUrl = null;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "New chat or topic",
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    duration: const Duration(seconds: 2),
                  ),
                );
              });
              await flutterTts.stop();
            },
            child: Wrap(
              spacing: 4,
              children: [
                Text(
                  "New chat",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Icon(
                  Icons.chat_rounded,
                  color: Theme.of(context).colorScheme.onSurface,
                )
              ],
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      drawer: sideBarMenu,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ZoomIn(
              child: const VirtualAssisstantProfile(),
            ),
            // Chat Bubble
            FadeInRight(
              child: Visibility(
                visible: generatedImageUrl == null,
                child: WelcomingStatment(
                  generatedContent: generatedContent,
                ),
              ),
            ),

            // Generated image widget
            if (generatedImageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!),
                ),
              ),

            // Features statement
            SlideInLeft(
              child: Visibility(
                visible: generatedContent == null && generatedImageUrl == null,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 25)
                      .copyWith(top: 10),
                  child: const Text(
                    "The Features:",
                    style: TextStyle(
                      fontFamily: "Cera Pro",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Feature List as Column to toggle them when their is content
            Visibility(
              visible: generatedContent == null && generatedImageUrl == null,
              child: Column(
                children: [
                  SlideInLeft(
                    delay: Duration(milliseconds: start),
                    child: FeatureBox(
                      colorScheme: Theme.of(context).colorScheme,
                      opacity: 0.7,
                      header: "ChatGPT",
                      content:
                          "A smart way to stay in touch with your ChatGPT.",
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + delay),
                    child: FeatureBox(
                      colorScheme: Theme.of(context).colorScheme,
                      opacity: 0.85,
                      header: "DALL-E",
                      content:
                          "Get inspired and stay creative with your personal assistant powered by DALL-E",
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + 2 * delay),
                    child: FeatureBox(
                      colorScheme: Theme.of(context).colorScheme,
                      opacity: 0.60,
                      header: "Both Functionalities",
                      content:
                          "Get the best of GPT & DALL-E with voice assistant AI",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ZoomIn(
        delay: Duration(milliseconds: start + 3 * delay),
        child: FloatingActionButton(
          onPressed: () async {
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              Future.delayed(
                const Duration(seconds: 5),
                () async {
                  final speech = await openAIService.isArtPromptAPI(lastWords);
                  if (speech.contains('https')) {
                    generatedImageUrl = speech;
                    generatedContent = null;
                    setState(() {});
                  } else {
                    generatedImageUrl = null;
                    generatedContent = speech;
                    setState(() {});
                    await systemSpeak(speech);
                  }
                  await stopListening();
                },
              );
            } else {
              initSpeechToText();
            }
          },
          child: Icon(
            speechToText.isListening ? Icons.stop : Icons.mic,
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
