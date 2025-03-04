import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/widgets/improvement_recommendation.dart';

class ImprovementsWidget extends StatelessWidget {
  const ImprovementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<(App, App)> recommendedAlternatives = getRecommendedAlternatives();
    if (recommendedAlternatives.isEmpty) {
      return Container();
    }
    return Column(
      children: [
        // Heading: "Das kannst Du besser machen"
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            'Das kannst Du besser machen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (final (App badApp, App goodApp) in recommendedAlternatives)
          ImprovementRecommendationWidget(
            badApp: badApp,
            goodApp: goodApp,
          ),
      ],
    );
  }
}
