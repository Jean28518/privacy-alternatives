import 'package:flutter/material.dart';
import 'package:privacy_alternatives/widgets/improvements.dart';
import 'package:privacy_alternatives/widgets/praises.dart';
import 'package:privacy_alternatives/widgets/privacy_lights.dart';
import 'package:privacy_alternatives/widgets/rethinks.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deine privaten Alternativen'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PrivacyLightsWidget(),
              ImprovementsWidget(),
              PraisesWidget(),
              RethinksWidget(),
            ],
          ),
        ));
  }
}
