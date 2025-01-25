import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/widgets/improvement_recommendation.dart';

class ImprovementsWidget extends StatelessWidget {
  const ImprovementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading: "Das kannst Du besser machen"
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            'Das kannst Du besser machen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (final (App badApp, App goodApp) in getRecommendedAlternatives())
          ImprovementRecommendationWidget(
            badApp: badApp,
            goodApp: goodApp,
          ),
      ],
    );
  }
}
