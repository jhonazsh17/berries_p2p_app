import 'package:flutter/material.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';

class ExchangeInProcess extends StatelessWidget {
  const ExchangeInProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      withBottomNavigation: false,
      withAppBar: false,
      body: Column(
        children: [
          Center(
            child: Text(
              'Intercambio en proceso',
              style: TextStyle(
                fontSize: 42,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontFamily: 'Gelasio-Bold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}