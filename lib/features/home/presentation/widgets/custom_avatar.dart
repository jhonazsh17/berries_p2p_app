import 'package:flutter/material.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key, this.radius = 30});

  final double radius;
  final Color _colorPrimary = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _colorPrimary,
          width: 3,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[400],
        backgroundImage: AssetImage('assets/images/luffy1.png'),
        onBackgroundImageError: (exception, stackTrace) {
          // Error handling
        },
      ),
    );
  }
}