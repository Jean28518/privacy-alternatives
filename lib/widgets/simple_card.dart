import 'dart:math';

import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/alternatives.dart';
import 'package:privacy_alternatives/content/apps.dart';
import 'package:privacy_alternatives/widgets/detail.dart';

class SimpleCard extends StatelessWidget {
  late final App app;
  SimpleCard({required this.app, super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final goodApp = isAppGood(app);
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DetailWidget(app: app);
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage('assets/images/apps/${app.code}.webp'),
                    width: min(screenSize.width * 0.15, 100),
                    height: min(screenSize.width * 0.15, 100),
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
                      Text(
                        app.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
          ),
        ),
      ),
    );
  }
}

// class SimpleCard extends StatelessWidget {
//   late final App app;
//   SimpleCard({required this.app, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//             ),
//             Flexible(
//                 child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Title', style: TextStyle(fontSize: 20)),
//                   Text(
//                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis augue lacus. Donec sodales ultricies volutpat. Nam consequat cursus elementum. Quisque ac massa viverra, interdum metus et, iaculis quam. Nullam in odio risus. Vivamus varius maximus fringilla. Donec aliquet odio sit amet turpis tristique pharetra. Vivamus sit amet finibus ante, ac mattis nisi. Suspendisse risus tortor, convallis quis dignissim at, varius in nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sit amet bibendum ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
//                     style: TextStyle(fontSize: 14),
//                     textAlign: TextAlign.justify,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
