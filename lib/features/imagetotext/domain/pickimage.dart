import 'dart:io';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);
  return image != null ? File(image.path) : null;
}
