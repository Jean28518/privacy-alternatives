import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/widgets/simple_card.dart';

class DetailWidget extends StatelessWidget {
  late final App app;
  DetailWidget({required this.app, super.key});

  @override
  Widget build(BuildContext context) {
    // Get all alternatives for the app
    final alternatives = getAlternativesTo(app);
    final screenSize = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.8,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SimpleCard(app: app),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Alternativen',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    for (final alternative in alternatives)
                      SimpleCard(app: alternative),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
