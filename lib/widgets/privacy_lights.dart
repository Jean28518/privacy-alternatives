import 'dart:math';

import 'package:flutter/material.dart';

class PrivacyLightsWidget extends StatefulWidget {
  const PrivacyLightsWidget({super.key});

  @override
  _PrivacyLightsWidgetState createState() => _PrivacyLightsWidgetState();
}

class _PrivacyLightsWidgetState extends State<PrivacyLightsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'assets/images/robbi.png',
                    width: min(screenSize.width * 0.2, 100),
                  ),
                ),
              ),
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
