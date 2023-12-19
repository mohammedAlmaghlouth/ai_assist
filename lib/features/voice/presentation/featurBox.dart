import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final ColorScheme colorScheme;
  final double opacity;
  final String header;
  final String content;

  const FeatureBox(
      {super.key,
      required this.colorScheme,
      required this.opacity,
      required this.header,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: colorScheme.inversePrimary.withOpacity(opacity),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: TextStyle(
                  fontFamily: "Cera Pro",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                content,
                style: TextStyle(
                  fontFamily: "Cera Pro",
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
