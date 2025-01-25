import 'dart:math';

import 'package:flutter/material.dart';
import 'package:privacy_alternatives/widgets/robbi.dart';

class PrivacyLightsWidget extends StatefulWidget {
  late final int score;
  PrivacyLightsWidget({required this.score, super.key});

  @override
  _PrivacyLightsWidgetState createState() => _PrivacyLightsWidgetState();
}

class _PrivacyLightsWidgetState extends State<PrivacyLightsWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Color scoreColor = const Color.fromARGB(255, 0, 117, 4);
    String lightsPath = 'assets/images/lights_green.png';
    if (widget.score < 80) {
      scoreColor = const Color.fromARGB(255, 185, 111, 0);
      lightsPath = 'assets/images/lights_yellow.png';
    }
    if (widget.score < 20) {
      scoreColor = const Color.fromARGB(255, 155, 10, 0);
      lightsPath = 'assets/images/lights_red.png';
    }
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: scoreColor.withAlpha(70),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RobbiWidget(
                    width: min(MediaQuery.of(context).size.width * 0.2, 100),
                  )),
              Image.asset(
                lightsPath,
                width: min(screenSize.width * 0.2, 100),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.score} / 100',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: scoreColor,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Dein Privacy Score',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
