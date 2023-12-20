import 'package:ai_assist/features/imagetotext/domain/utils.dart';
import 'package:ai_assist/features/imagetotext/presentation/recognitionscreen.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final String imagePath;
  final String title;
  final String description;
  final Widget route;

  CustomCard({
    required this.color,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      child: Card(
        color: color,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                style: textStyle(10, Theme.of(context).colorScheme.onTertiary,
                    FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  imagePath,
                  width: 32,
                  height: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
