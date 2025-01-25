import 'dart:math';

import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/pages/detail.dart';
import 'package:privacy_alternatives/widgets/app_icon.dart';

class ImprovementRecommendationWidget extends StatelessWidget {
  late final App badApp;
  late final App goodApp;

  ImprovementRecommendationWidget(
      {required this.badApp, required this.goodApp, super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(255, 0, 0, 0.298),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .popUntil((route) => route.isFirst);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailPage(app: badApp),
                        ));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppIconWidget(
                            app: badApp,
                            size: Size(
                              min(screenSize.width * 0.15, 100),
                              min(screenSize.width * 0.15, 100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 8,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(51, 255, 0, 0.298),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .popUntil((route) => route.isFirst);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(app: goodApp),
                    ));
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        AppIconWidget(
                          app: goodApp,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                goodApp.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                goodApp.description,
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
