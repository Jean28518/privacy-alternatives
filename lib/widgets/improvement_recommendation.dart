import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';

class ImprovementRecommendationWidget extends StatelessWidget {
  late final App foundApp;
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
                  image: AssetImage('assets/images/apps/${foundApp.code}.webp'),
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
                            'assets/images/apps/${alternative.app.code}.webp'),
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
                            alternative.app.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: screenSize.width * 0.5),
                            child: Flexible(
                              child: Text(
                                alternative.app.description,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.justify,
                                maxLines: 3,
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
