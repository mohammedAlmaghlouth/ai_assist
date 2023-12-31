import 'dart:io';

import 'package:ai_assist/features/dall/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ArtsScreen extends StatefulWidget {
  const ArtsScreen({super.key});

  @override
  State<ArtsScreen> createState() => _ArtsScreenState();
}

class _ArtsScreenState extends State<ArtsScreen> {
  List imgList = [];

  getImages() async {
    final externalDirectory = await getExternalStorageDirectory();
    final directory = Directory('${externalDirectory?.path}/AI Image');
    imgList = directory.listSync();
    print(imgList);
  }

  popImage(filepath) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: whileColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.file(
                  filepath,
                  fit: BoxFit.cover,
                ),
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Art Gallery",
            style: TextStyle(
              fontFamily: "poppins_bold",
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 300),
            itemCount: imgList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  popImage(imgList[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.file(imgList[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
        ));
  }
}
