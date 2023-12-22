import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String content;
  const MyButton({super.key, required this.onTap, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: MediaQuery.platformBrightnessOf(context)
              .name ==
              "dark"
              ? Theme.of(context).colorScheme.inversePrimary
              : Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              color: MediaQuery.platformBrightnessOf(context)
                  .name ==
                  "light"
                  ? Theme.of(context).colorScheme.onSecondaryContainer
                  : Theme.of(context).colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
