import 'dart:math';

import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/pages/detail.dart';
import 'package:privacy_alternatives/widgets/app_icon.dart';

class SimpleCard extends StatelessWidget {
  late final App app;
  late final bool hideBackground;
  SimpleCard({required this.app, this.hideBackground = false, super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final goodApp = isAppGood(app);
    if (hideBackground) {
      return SimpleCardWithoutBackground(app: app, screenSize: screenSize);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: goodApp
              ? Color.fromRGBO(51, 255, 0, 0.298)
              : Color.fromRGBO(255, 0, 0, 0.298),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.of(context, rootNavigator: true)
                .popUntil((route) => route.isFirst);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(app: app),
            ));
          },
          child: SimpleCardWithoutBackground(app: app, screenSize: screenSize),
        ),
      ),
    );
  }
}

class SimpleCardWithoutBackground extends StatelessWidget {
  const SimpleCardWithoutBackground({
    super.key,
    required this.app,
    required this.screenSize,
  });

  final App app;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          AppIconWidget(
            app: app,
            size: Size(
              min(screenSize.width * 0.15, 100),
              min(screenSize.width * 0.15, 100),
            ),
          ),
          Container(
            width: 16,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      app.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Info icon:
                    Icon(
                      Icons.info,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  app.description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
