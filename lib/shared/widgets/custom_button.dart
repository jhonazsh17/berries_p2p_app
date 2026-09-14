import 'package:flutter/material.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.outlined = false,
    this.textColor,
    this.active = false,
    this.withMarginRight = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool outlined;
  final Color? textColor;
  final bool active;
  final bool withMarginRight;

  @override
  Widget build(BuildContext context) {
    final resolvedTextColor =
        textColor ?? (outlined ? AppColors.primary : Colors.white);

    return Container(
      margin: withMarginRight ? const EdgeInsets.only(right: 8) : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: active
              ? AppColors.primary
              : outlined
              ? Colors.white
              : AppColors.primary,
          foregroundColor: resolvedTextColor,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: resolvedTextColor,
          ),
        ),
      ),
    );
  }
}
