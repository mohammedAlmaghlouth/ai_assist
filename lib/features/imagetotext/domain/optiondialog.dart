import 'dart:io';

import 'package:ai_assist/features/imagetotext/domain/pickimage.dart';
import 'package:ai_assist/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

optionsdialog(BuildContext context, Function(File?) callback) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        children: [
          SimpleDialogOption(
            onPressed: () async {
              final image = await pickImage(ImageSource.gallery);
              callback(image);
              Navigator.pop(context);
            },
            child: Text(
              "Gallery",
              style: textStyle(
                  size: 20,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fw: FontWeight.w600),
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
              style: textStyle(
                size: 20,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fw: FontWeight.w600,
              ),
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: textStyle(
                size: 20,
                color: const Color.fromARGB(255, 255, 0, 0),
                fw: FontWeight.w300,
              ),
            ),
          )
        ],
      );
    },
  );
}
