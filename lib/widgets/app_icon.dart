import 'package:flutter/material.dart';
import 'package:privacy_alternatives/content/apps.dart';

class AppIconWidget extends StatelessWidget {
  late final App app;
  late final Size size;
  AppIconWidget({required this.app, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: app.icon != null
          ? Image.memory(
              app.icon!,
              width: size.width,
              height: size.height,
            )
          : Image(
              image: AssetImage('assets/images/apps/${app.code}.webp'),
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/apps/placeholder.webp',
                  width: size.width,
                  height: size.height,
                );
              },
              width: size.width,
              height: size.height,
            ),
    );
  }
}
