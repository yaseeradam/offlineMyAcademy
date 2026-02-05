import 'package:flutter/material.dart';
import 'package:smartlink/core/theme/app_theme.dart';

class TrustBadge extends StatelessWidget {
  final bool isVerified;
  final String text;

  const TrustBadge({
    super.key,
    this.isVerified = true,
    this.text = 'Trusted',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isVerified ? AppTheme.primaryColor.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isVerified ? AppTheme.primaryColor : Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isVerified)
            const Icon(
              Icons.verified_user,
              size: 14,
              color: AppTheme.primaryColor,
            ),
          if (isVerified) const SizedBox(width: 4),
          Text(
            text.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isVerified ? AppTheme.primaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
