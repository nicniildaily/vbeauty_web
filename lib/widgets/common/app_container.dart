import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;

  const AppContainer({
    super.key,
    required this.child,
    this.maxWidth = 1000,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? 1000),
        child: Padding(
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
          child: child,
        ),
      ),
    );
  }
}
