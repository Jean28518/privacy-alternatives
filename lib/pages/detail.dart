import 'dart:math';
import 'package:privacy_alternatives/widgets/app_icon.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/widgets/simple_card.dart';

class DetailPage extends StatelessWidget {
  late final App app;
  DetailPage({required this.app, super.key});

  @override
  Widget build(BuildContext context) {
    // Get all alternatives for the app
    final alternatives = getAlternativesTo(app);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            AppIconWidget(
              app: app,
              size: const Size(
                40,
                40,
              ),
            ),
            SizedBox(width: 10),
            Text(app.title),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(app.description, textAlign: TextAlign.justify),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  // App the google play store with the app's package name
                  launchUrl(Uri.parse(
                      'https://play.google.com/store/apps/details?id=${app.code}'));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Im App-Store öffnen',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
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
    );
  }
}
