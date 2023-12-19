import 'package:flutter/material.dart';

class VirtualAssisstantProfile extends StatelessWidget {
  const VirtualAssisstantProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 120,
            width: 120,
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Container(
          height: 125,
          margin: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/virtualAssistant.png"),
            ),
          ),
        ),
      ],
    );
  }
}
