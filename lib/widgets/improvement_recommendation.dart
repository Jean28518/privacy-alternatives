import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';

class ImprovementRecommendationWidget extends StatelessWidget {
  late final String foundApp;
  late final Alternative alternative;

  ImprovementRecommendationWidget(
      {required this.foundApp, required this.alternative, super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(255, 0, 0, 0.298),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image:
                      AssetImage('assets/images/apps/com.android.chrome.webp'),
                  width: screenSize.width * 0.15,
                  height: screenSize.width * 0.15,
                ),
              ),
            ),
          ),
          Container(
            width: 8,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(51, 255, 0, 0.298),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: AssetImage(
                            'assets/images/apps/com.duckduckgo.mobile.android.webp'),
                        width: screenSize.width * 0.15,
                        height: screenSize.width * 0.15,
                      ),
                    ),
                    Container(
                      width: 16,
                    ),
                    Container(
                      height: screenSize.width * 0.15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Privacy Lights',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: screenSize.width * 0.6),
                            child: Flexible(
                              child: Text(
                                'This widget indicates the privacy status using animated lights.',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
