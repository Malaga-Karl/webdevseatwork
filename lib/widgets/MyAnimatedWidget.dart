import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  MyAnimatedWidget({
    required this.child,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Opacity(
          opacity: animation.value,
          child: child,
        ),
        child: child,
      ),
    );
  }
}
