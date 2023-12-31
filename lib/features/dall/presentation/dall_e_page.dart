// ignore_for_file: camel_case_types

import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ai_assist/features/dall/application/api_services.dart';
import 'package:ai_assist/features/dall/presentation/arts_screen.dart';
import 'package:ai_assist/features/dall/data/colors.dart';
import 'package:ai_assist/main.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class Dall_E_Page extends StatefulWidget {
  final sideBarMenu;

  const Dall_E_Page({super.key, this.sideBarMenu});

  @override
  State<Dall_E_Page> createState() => _Dall_E_PageState();
}

class _Dall_E_PageState extends State<Dall_E_Page> {
  var sizes = ["Small", "Medium", "Large"];
  var values = ["256x256", "512x512", "1024x1024"];
  String? dropValue;
  var textController = TextEditingController();
  String image = '';
  var isLoaded = false;
  ScreenshotController screenshotController = ScreenshotController();

  // downloadImg() async {
  //   var result = await Permission.storage.request();
  //
  //   if (result.isGranted) {
  //     final foldername = "AI Image";
  //
  //     final path = Directory("storage/emulated/0/$foldername");
  //     final filename = "${DateTime.now().microsecondsSinceEpoch}.png";
  //
  //     if (await path.exists()) {
  //       await screenshotController.captureAndSave(path.path,
  //           delay: Duration(milliseconds: 100),
  //           fileName: filename,
  //           pixelRatio: 1.0);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             "Downloaded to ${path.path}",
  //             style: TextStyle(
  //               color: Theme.of(context).colorScheme.onSecondaryContainer,
  //             ),
  //           ),
  //           backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
  //         ),
  //       );
  //     } else {
  //       await path.create();
  //       await screenshotController.captureAndSave(path.path,
  //           delay: Duration(milliseconds: 100),
  //           fileName: filename,
  //           pixelRatio: 1.0);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             "Downloaded to ${path.path}",
  //             style: TextStyle(
  //               color: Theme.of(context).colorScheme.onSecondaryContainer,
  //             ),
  //           ),
  //           backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
  //         ),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           "Permission denied",
  //           style: TextStyle(
  //             color: Theme.of(context).colorScheme.onSecondaryContainer,
  //           ),
  //         ),
  //         backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
  //       ),
  //     );
  //   }
  // }

  downloadImg() async {
    var result = await Permission.manageExternalStorage.request();

    if (result.isGranted) {
      final foldername = "AI Image";

      // Using path_provider to get the correct external storage directory
      final externalDirectory = await getExternalStorageDirectory();
      final path = Directory('${externalDirectory?.path}/$foldername');
      final filename = "${DateTime.now().microsecondsSinceEpoch}.png";

      try {
        if (!await path.exists()) {
          await path.create();
        }
        // Make sure screenshotController is initialized and captureAndSave method is used correctly
        await screenshotController.captureAndSave(path.path,
            delay: Duration(milliseconds: 100),
            fileName: filename,
            pixelRatio: 1.0);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Downloaded to ${path.path}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          ),
        );
      } catch (e) {
        print("Error saving image: $e");
        // Handle the error or show a message
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Permission denied",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
      );
    }
  }

  shareImage() async {
    await screenshotController
        .capture(delay: Duration(milliseconds: 100), pixelRatio: 1.0)
        .then((Uint8List? img) async {
      if (img != null) {
        final directory = (await getApplicationDocumentsDirectory()).path;
        final filename = "share.png";
        final imgpath = await File("${directory}/$filename").create();
        await imgpath.writeAsBytes(img);

        Share.shareFiles([imgpath.path], text: "Generated by AI - Abusaad");
      } else {
        print("Failed to take a screenshot");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         padding: EdgeInsets.all(8),
        //         elevation: 2,
        //         backgroundColor: Theme
        //             .of(context)
        //             .colorScheme
        //             .onSecondary,
        //       ),
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const ArtsScreen()));
        //       },
        //       child: Text(
        //         "My Arts",
        //         style: TextStyle(
        //           color: Theme
        //               .of(context)
        //               .colorScheme
        //               .onSecondaryContainer,
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
        centerTitle: true,
        title: Text(
          "AI Image Generator",
          style: TextStyle(
            fontFamily: "poppins_bold",
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: sideBarMenu,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            controller: textController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                              hintText: "eg 'A lion on moon'",
                              border: InputBorder.none,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 44,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            icon: Icon(Icons.expand_more,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            value: dropValue,
                            hint: Text(
                              "Select size",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                            ),
                            items: List.generate(
                                sizes.length,
                                (index) => DropdownMenuItem(
                                      child: Text(
                                        sizes[index],
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer),
                                      ),
                                      value: values[index],
                                    )),
                            onChanged: (value) {
                              setState(() {
                                dropValue = value.toString();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      width: 300,
                      height: 44,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              shape: const StadiumBorder()),
                          onPressed: () async {
                            if (textController.text.isNotEmpty &&
                                dropValue!.isNotEmpty) {
                              setState(() {
                                isLoaded = false;
                              });

                              image = await Api.generateImage(
                                  textController.text, dropValue!);
                              setState(() {
                                isLoaded = true;
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Please pass the query and size",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                    ),
                                  ),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                              );
                            }
                          },
                          child: Text("Generate",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer))))
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: isLoaded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Screenshot(
                            controller: screenshotController,
                            child: Image.network(
                              image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.download_for_offline_rounded,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(8),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                                onPressed: () {
                                  downloadImg();
                                },
                                label: Text(
                                  "Download",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton.icon(
                              icon: Icon(
                                Icons.share,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(8),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                              onPressed: () async {
                                await shareImage();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Image shared",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                      ),
                                    ),
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                  ),
                                );
                              },
                              label: Text(
                                "Share",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.surface),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/loader.gif"),
                          const SizedBox(height: 12),
                          Text(
                            "Waiting for image to be generated...",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).colorScheme.onSurface),
                          )
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Developed by Soud Alqahtani",
                style: TextStyle(color: whileColor, fontSize: 14.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
