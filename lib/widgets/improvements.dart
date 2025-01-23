import 'package:flutter/material.dart';
import 'package:privacy_alternatives/widgets/improvement_recommendation.dart';

class ImprovementsWidget extends StatelessWidget {
  const ImprovementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading: "Das kannst Du besser machen"
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Das kannst Du besser machen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ImprovementRecommendationWidget()
      ],
    );
  }
}
