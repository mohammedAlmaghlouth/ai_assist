import 'package:ai_assist/features/chatgpt/presentation/chatgpt_page.dart';
import 'package:ai_assist/features/imagetotext/presentation/recognitionscreen.dart';
import 'package:ai_assist/features/main/presentation/custom_card.dart';
import 'package:ai_assist/shared/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Logo',
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Container(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 1.0,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: [
              CustomCard(
                  color: Colors.green,
                  imagePath: 'lib/features/main/data/images/chatgpt.png',
                  title: "ChatGPT",
                  description:
                      "Use an advanced AI language model for natural language conversations.",
                  route: ChatGPT()),
              CustomCard(
                  color: Colors.brown,
                  imagePath: 'lib/features/main/data/images/dalle.png',
                  title: "Dall-E",
                  description:
                      "Use a groundbreaking AI model creating images from textual descriptions.",
                  route: RecognitionScreen()),
              CustomCard(
                color: Colors.blue,
                imagePath: 'lib/features/main/data/images/imageToText.png',
                title: "Image to Text",
                description:
                    "Convert descriptive content from images into text through advanced processing",
                route: RecognitionScreen(),
              ),
              CustomCard(
                  color: Colors.pink,
                  imagePath: 'lib/features/main/data/images/imageToText.png',
                  title: "AI Voice Assistant",
                  description:
                      "Ask questions using the microphone and receive answers accordingly",
                  route: RecognitionScreen()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
