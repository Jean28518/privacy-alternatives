import 'package:flutter/material.dart';
import 'dart:math';

class RobbiWidget extends StatefulWidget {
  late final double width;
  RobbiWidget({this.width = 100, super.key});

  @override
  _RobbiWidgetState createState() => _RobbiWidgetState();
}

class _RobbiWidgetState extends State<RobbiWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: Image.asset(
        'assets/images/robbi.png',
        width: widget.width,
      ),
    );
  }
}
