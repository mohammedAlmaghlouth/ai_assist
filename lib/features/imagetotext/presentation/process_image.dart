import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

Future<String> recognizeImage(File? pickedimage) async {
  final textRecognizer = TextRecognizer();
  final inputImage = InputImage.fromFile(pickedimage!);

  try {
    final recognizedText = await textRecognizer.processImage(inputImage);

    if (recognizedText.text.isEmpty) {
      // No text recognized
      return "There is no text recognized";
    } else {
      // Text recognized
      print(recognizedText.text);
      return recognizedText.text;
    }
  } catch (e) {
    print("Error during text recognition: $e");
    return "Error";
  } finally {
    // Clean up resources if needed
    textRecognizer.close();
  }
}
