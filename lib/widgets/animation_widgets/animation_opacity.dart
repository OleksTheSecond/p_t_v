import 'package:flutter/material.dart';

class LinearAnimationOpacity extends StatelessWidget {
  const LinearAnimationOpacity(
      {super.key, required this.child, required this.opacity});
  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        curve: Curves.linear,
        opacity: opacity,
        duration: const Duration(milliseconds: 400),
        child: child);
  }
}
