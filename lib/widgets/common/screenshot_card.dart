import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';

class ScreenshotCard extends StatefulWidget {
  final ImageProvider image;
  final double? height;

  const ScreenshotCard({super.key, required this.image, this.height});

  @override
  State<ScreenshotCard> createState() => _ScreenshotCardState();
}

class _ScreenshotCardState extends State<ScreenshotCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: 300.ms,
        curve: Curves.easeOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: widget.height ?? 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryPurple.withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Image(
              image: widget.image,
              height: widget.height ?? 400,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
