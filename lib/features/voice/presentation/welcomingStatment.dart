import 'package:flutter/material.dart';

class WelcomingStatment extends StatefulWidget {
  final String? generatedContent;

  const WelcomingStatment({super.key, this.generatedContent});

  @override
  State<WelcomingStatment> createState() => _WelcomingStatmentState();
}

class _WelcomingStatmentState extends State<WelcomingStatment> {
  final List<String> _openingPhrase = [
    "Good Morning",
    "Good Afternoon",
    "Good Evening"
  ];

  // Getting the current hour to display the correct phrase

  String getOpentingPhrase() {
    var time = DateTime.now().hour;
    if (time <= 12) {
      return _openingPhrase[0];
    } else if (time <= 18) {
      return _openingPhrase[1];
    } else {
      return _openingPhrase[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20).copyWith(
          topLeft: Radius.zero,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          widget.generatedContent == null
              ? "${getOpentingPhrase()}, how can I help you?"
              : widget.generatedContent!,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontSize: widget.generatedContent == null ? 20: 15,
            fontFamily: "Cera Pro",
          ),
        ),
      ),
    );
  }
}
