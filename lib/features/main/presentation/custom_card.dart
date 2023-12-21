import 'package:ai_assist/shared/utils.dart';
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
      child: Container(
        child: Card(
            color: color,
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.25,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
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
                                color:
                                    Theme.of(context).colorScheme.onTertiary),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        description,
                        style: textStyle(
                            size: 10,
                            color: Theme.of(context).colorScheme.onTertiary,
                            fw: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
