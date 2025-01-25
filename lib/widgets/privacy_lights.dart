import 'dart:math';

import 'package:flutter/material.dart';
import 'package:privacy_alternatives/widgets/robbi.dart';

class PrivacyLightsWidget extends StatefulWidget {
  const PrivacyLightsWidget({super.key});

  @override
  _PrivacyLightsWidgetState createState() => _PrivacyLightsWidgetState();
}

class _PrivacyLightsWidgetState extends State<PrivacyLightsWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(255, 255, 0, 0.3),
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
                'assets/images/lights_yellow.png',
                width: min(screenSize.width * 0.2, 100),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy Lights',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'This widget indicates the privacy status using animated lights.',
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
