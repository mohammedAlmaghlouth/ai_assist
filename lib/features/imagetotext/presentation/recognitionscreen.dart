// Import necessary libraries
import 'dart:io';
import 'package:ai_assist/features/imagetotext/domain/optiondialog.dart';
import 'package:ai_assist/features/imagetotext/domain/utils.dart';
import 'package:ai_assist/features/imagetotext/presentation/process_image.dart';
import 'package:ai_assist/shared/bottom_navigation.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({super.key});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  int _currentIndex = 0;
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
              24, const Color.fromARGB(255, 174, 174, 174), FontWeight.w600),
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
        backgroundColor: const Color.fromARGB(184, 114, 5, 111),
      ),
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Share button
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
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
                        style: textStyle(14, Colors.white, FontWeight.w500),
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
                  border: Border.all(color: Colors.white), // Set border color
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  recognizedText ?? "No text recognized",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/mainHomePage');
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
