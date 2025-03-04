import 'dart:math';

import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/widgets/improvements.dart';
import 'package:privacy_alternatives/widgets/praises.dart';
import 'package:privacy_alternatives/widgets/privacy_lights.dart';
import 'package:privacy_alternatives/widgets/rethinks.dart';
import 'package:privacy_alternatives/services/installed_apps.dart';
import 'package:privacy_alternatives/widgets/robbi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var installedApps = InstalledAppsService.init();
    return FutureBuilder(
      future: installedApps,
      builder: (BuildContext context, AsyncSnapshot<List<AppInfo>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RobbiWidget(
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(height: 20),
              Text(
                "Hi! Ich bin Robbi.\nIch schau mal, was Du installiert hast...",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              CircularProgressIndicator(),
            ],
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return Scaffold(
            // appBar: AppBar(
            //   title: Text('Deine privaten Alternativen'),
            // ),
            body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: min(screenSize.width, 1000),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    PrivacyLightsWidget(score: getPrivacyScore()),
                    ImprovementsWidget(),
                    RethinksWidget(),
                    PraisesWidget(),
                  ],
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
