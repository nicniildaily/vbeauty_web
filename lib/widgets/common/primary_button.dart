import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';

enum ButtonVariant { filled, outlined, white }

class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.filled,
    this.icon,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isFilled = widget.variant == ButtonVariant.filled;
    final isWhite = widget.variant == ButtonVariant.white;

    final bgColor = isWhite
        ? AppColors.white
        : isFilled
        ? AppColors.primaryPurple
        : Colors.transparent;
    final fgColor = isWhite ? AppColors.primaryPurple : AppColors.white;
    final borderColor = isWhite ? AppColors.white : AppColors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: 200.ms,
        curve: Curves.easeInOut,
        child: OutlinedButton.icon(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: fgColor,
            side: BorderSide(color: borderColor, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: widget.icon != null ? Icon(widget.icon, size: 20) : null,
          label: Text(widget.label),
        ),
      ),
    );
  }
}
