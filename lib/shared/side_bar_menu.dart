import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  final supabaseServices;

  const SideBarMenu({super.key, required this.supabaseServices});

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

  // Widget buildHeader(BuildContext context) {
  //   Future<List<String>> userFuture = supabaseServices.getUser();
  //   List<String> userData = [];
  //
  //   userFuture.then((data) => userData = data);
  //
  //   return Material(
  //     color: Colors.transparent,
  //     child: InkWell(
  //       onTap: () {
  //         print("Header Pressed");
  //       },
  //       child: Container(
  //         padding: EdgeInsets.only(
  //           top: 24 + MediaQuery.of(context).padding.top,
  //           bottom: 24,
  //         ),
  //         child: Column(
  //           children: [
  //             CircleAvatar(
  //               radius: 52,
  //               backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  //               child: Icon(
  //                 Icons.account_circle_rounded,
  //                 size: 104,
  //                 color: Theme.of(context).colorScheme.onSecondaryContainer,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 12,
  //             ),
  //             Text(
  //               userData.isEmpty? "null": userData[0],
  //               style: TextStyle(
  //                 fontSize: 24,
  //                 color: Theme.of(context).colorScheme.onInverseSurface,
  //               ),
  //             ),
  //             Text(
  //               userData.isEmpty? "null": userData[1],
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 color: Theme.of(context).colorScheme.onInverseSurface,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildHeader(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: supabaseServices.getUser(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while waiting for the future
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error state
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Data is available, build the UI
          List<String> userData = snapshot.data!;
          return Material(
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
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userData[0], // Username
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ),
                    Text(
                      userData[1], // Email
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
        } else {
          // Handle the case where you have no data
          return Text('No data');
        }
      },
    );
  }

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(15),
        child: Wrap(
          spacing: 10,
          children: [
            ListTile(
              leading: const Icon(Icons.home_rounded, size: 30),
              title: const Text("Home"),
              onTap: () {
                // put navigation to Home
                Navigator.pushReplacementNamed(context, "/homePage");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              selectedColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            ListTile(
              leading: const Icon(Icons.chat_rounded, size: 30),
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
              leading: const Icon(Icons.image, size: 30),
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
              leading: const Icon(Icons.text_fields_rounded, size: 30),
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
              leading: const Icon(Icons.mic, size: 30),
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
              leading: const Icon(Icons.logout_rounded, size: 30),
              title: const Text("Logout"),
              onTap: () async {
                // For Logging out
                await supabaseServices.signOut();
                // print(Navigator.of(context).);
                Navigator.popUntil(
                  context,
                  ModalRoute.withName("/")
                );
                Navigator.pushReplacementNamed(context, "/");
              },
              iconColor: Theme.of(context).colorScheme.onInverseSurface,
              textColor: Theme.of(context).colorScheme.onInverseSurface,
              splashColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      );
}
