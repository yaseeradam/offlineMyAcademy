import 'package:flutter/material.dart';
import 'package:smartlink/core/theme/app_theme.dart';

enum SmartButtonStyle { primary, secondary, ghost, outline }

class SmartButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final SmartButtonStyle style;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  const SmartButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = SmartButtonStyle.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color backgroundColor;
    Color foregroundColor;
    BorderSide? borderSide;

    switch (style) {
      case SmartButtonStyle.primary:
        backgroundColor = AppTheme.primaryColor;
        foregroundColor = Colors.white;
        break;
      case SmartButtonStyle.secondary:
        backgroundColor = colorScheme.surfaceContainerHighest;
        foregroundColor = colorScheme.onSurfaceVariant;
        break;
      case SmartButtonStyle.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = colorScheme.onSurface;
        borderSide = BorderSide(color: colorScheme.outline);
        break;
      case SmartButtonStyle.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = colorScheme.primary;
        break;
    }

    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          )
        else ...[
          if (icon != null) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ],
    );

    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: style == SmartButtonStyle.primary ? 2 : 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: borderSide ?? BorderSide.none,
      ),
    );

    if (style == SmartButtonStyle.ghost) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        child: child,
      );
    }

    Widget button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: buttonStyle,
      child: child,
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
