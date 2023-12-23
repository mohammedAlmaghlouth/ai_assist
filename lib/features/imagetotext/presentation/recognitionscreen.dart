// Import necessary libraries
import 'dart:io';
import 'package:ai_assist/features/imagetotext/domain/optiondialog.dart';
import 'package:ai_assist/main.dart';
import 'package:ai_assist/shared/side_bar_menu.dart';
import 'package:ai_assist/shared/utils.dart';
import 'package:ai_assist/features/imagetotext/presentation/process_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class RecognitionScreen extends StatefulWidget {
  final SideBarMenu sideBarMenu;

  const RecognitionScreen({super.key, required this.sideBarMenu});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  File? pickedimage;
  String? recognizedText;

  // Callback function to update the state with the selected image
  void updateSelectedImage(File? image) async {
    if (image != null) {
      recognizedText = await recognizeImage(image);

      setState(() {
        pickedimage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image to text",
          style: textStyle(
              size: 24,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: sideBarMenu,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Share button
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                heroTag: null,
                // Disables hero animation
                backgroundColor: Color.fromARGB(255, 14, 79, 169),
                onPressed: () => Share.share(recognizedText!),
                child: Icon(
                  Icons.share,
                  size: 30,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(34.0)),
                ),
              ),
            ),
            // Copy button
            Container(
              margin: EdgeInsets.only(top: 10),
              child: FloatingActionButton(
                onPressed: () {
                  FlutterClipboard.copy(recognizedText!).then((value) {
                    SnackBar snackBar = SnackBar(
                      content: Text(
                        "Text has been copied to clipboard",
                        // style: textStyle(14, Colors.white, FontWeight.w500),
                      ),
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                child: Icon(
                  Icons.copy,
                  size: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(34.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => optionsdialog(context, updateSelectedImage),
                child: pickedimage == null
                    ? Image(
                  width: 256,
                  height: 256,
                  image: AssetImage(
                    'lib/features/imagetotext/data/images/add_image.png',
                  ),
                  fit: BoxFit.fill,
                )
                    : Image.file(
                  pickedimage!,
                  width: 256,
                  height: 256,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: MediaQuery.platformBrightnessOf(context).name ==
                          "dark"
                          ? Theme.of(context).colorScheme.onInverseSurface
                          : Theme.of(context)
                          .colorScheme
                          .onSurface), // Set border color
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  recognizedText ?? "No text recognized",
                  style: TextStyle(
                    fontSize: 16,
                    color:
                    MediaQuery.platformBrightnessOf(context).name == "dark"
                        ? Theme.of(context).colorScheme.onInverseSurface
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
