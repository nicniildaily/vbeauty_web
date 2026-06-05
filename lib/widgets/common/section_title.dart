import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms, curve: Curves.easeOut)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut);
  }
}
