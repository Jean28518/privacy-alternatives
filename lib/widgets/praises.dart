import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/widgets/simple_card.dart';

class PraisesWidget extends StatelessWidget {
  PraisesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading: "Das kannst Du besser machen"
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            'Das machst Du schon gut',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SimpleCard(
          app: APPS['org.mozilla.firefox']!,
        )
      ],
    );
  }
}
