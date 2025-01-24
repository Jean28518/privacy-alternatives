import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/apps.dart';

class DetailWidget extends StatelessWidget {
  late final App app;
  DetailWidget({required this.app, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(app.title),
      content: Text('Details about ${app.title}'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
