import 'package:ai_assist/features/main/presentation/custom_card.dart';
import 'package:ai_assist/main.dart';
import 'package:ai_assist/shared/side_bar_menu.dart';
import 'package:ai_assist/shared/utils.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final SideBarMenu sideBarMenu;
  final supabaseServices;

  const MainPage({super.key, required this.sideBarMenu, this.supabaseServices});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if(didPop){
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 64,
                  width: 64,
                ),
              ),
              Text(
                'AI Assistant',
                style: TextStyle(
                  fontFamily: "Cera Pro",
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
        ),
        drawer: sideBarMenu,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: MediaQuery.platformBrightnessOf(context).name == "dark"
                    ? AssetImage('assets/images/pattern.png')
                    : AssetImage('assets/images/patternLight.png'),
                fit: BoxFit.cover,
                opacity: 0.25),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 10),
                child: Center(
                  child: Text("Select An AI \n Service",
                      textAlign: TextAlign.center,
                      style: textStyle(
                          size: 48,
                          color: MediaQuery.platformBrightnessOf(context)
                                      .name ==
                                  "dark"
                              ? Theme.of(context).colorScheme.onInverseSurface
                              : Theme.of(context).colorScheme.onSurface,
                          fw: FontWeight.w500)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(16.0),
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      children: [
                        CustomCard(
                            color: Colors.green,
                            imagePath:
                                'lib/features/main/data/images/chatgpt.png',
                            title: "ChatGPT",
                            description:
                                "Use an advanced AI language model for natural language conversations.",
                            route: "/chatGPT"),
                        CustomCard(
                          color: Colors.brown,
                          imagePath:
                              'lib/features/main/data/images/dalleLogo.png',
                          title: "Dall-E",
                          description:
                              "Use a groundbreaking AI model creating images from textual descriptions.",
                          route: "/DALL-E",
                        ),
                        CustomCard(
                          color: Colors.deepPurple,
                          imagePath:
                              'lib/features/imagetotext/data/images/add_image.png',
                          title: "Image to Text",
                          description:
                              "Convert descriptive content from images into text through advanced processing",
                          route: "/ImageToText",
                        ),
                        CustomCard(
                            color: Colors.pink,
                            imagePath: 'assets/images/virtualAssistant.png',
                            title: "AI Voice Assistant",
                            description:
                                "Ask questions using the microphone and receive answers accordingly",
                            route: "/VoiceAIAssistant"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
