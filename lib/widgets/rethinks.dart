import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/widgets/simple_card.dart';

class RethinksWidget extends StatelessWidget {
  RethinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading: "Das kannst Du besser machen"
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            'Diese Apps solltest Du überdenken',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (final app in getInstalledBadApps()) SimpleCard(app: app),
      ],
    );
  }
}
