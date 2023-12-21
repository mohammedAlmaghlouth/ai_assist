import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  final String user;
  final String email;
  const SideBarMenu({super.key, required this.user, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          Theme.of(context).colorScheme.inverseSurface.withOpacity(0.9),
      child: ListView(
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("Header Pressed");
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 104,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  user,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(15),
        child: Wrap(
          spacing: 10,
          children: [
            ListTile(
              leading: const Icon(Icons.home_rounded,size: 30),
              title: const Text("Home"),
              onTap: () {
                // put navigation to Home
                Navigator.pushReplacementNamed(context, "/mainHomePage");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              selectedColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            ListTile(
              leading: const Icon(Icons.chat_rounded,size: 30),
              title: const Text("chatGPT"),
              onTap: () {
                // put navigation to chatGPT
                Navigator.pushReplacementNamed(context, "/chatGPT");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              selectedColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            ListTile(
              leading: const Icon(Icons.image,size: 30),
              title: const Text("Dall-E"),
              onTap: () {
                // put navigation to Dall-E
                Navigator.pushReplacementNamed(context, "/DALL-E");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              selectedColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            ListTile(
              leading: const Icon(Icons.text_fields_rounded,size: 30),
              title: const Text("Image to text"),
              onTap: () {
                // put navigation to Image to text
                Navigator.pushReplacementNamed(context, "/ImageToText");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              selectedColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            ListTile(
              leading: const Icon(Icons.mic,size: 30),
              title: const Text("Voice AI Assistant"),
              onTap: () {
                // put navigation to Voice AI Assistant
                Navigator.pushReplacementNamed(context, "/VoiceAIAssistant");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              selectedColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded,size: 30),
              title: const Text("Logout"),
              onTap: () {
                // For Logging out
                Navigator.pushReplacementNamed(context, "/logout");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              splashColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      );
}
