import 'dart:io';

import 'package:ai_assist/features/imagetotext/domain/pickimage.dart';
import 'package:ai_assist/features/imagetotext/domain/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

optionsdialog(BuildContext context, Function(File?) callback) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () async {
              final image = await pickImage(ImageSource.gallery);
              callback(image);
              Navigator.pop(context);
            },
            child: Text(
              "Gallery",
              style: textStyle(20, Colors.black, FontWeight.w600),
            ),
          ),
          SimpleDialogOption(
            onPressed: () async {
              final image = await pickImage(ImageSource.camera);
              callback(image);
              Navigator.pop(context);
            },
            child: Text(
              "Camera",
              style: textStyle(20, Colors.black, FontWeight.w600),
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: textStyle(
                  20, const Color.fromARGB(255, 255, 0, 0), FontWeight.w300),
            ),
          )
        ],
      );
    },
  );
}
