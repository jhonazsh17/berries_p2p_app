import 'package:berries_p2p_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:berries_p2p_app/shared/widgets/custom_avatar.dart';
import 'package:berries_p2p_app/shared/widgets/custom_card.dart';

class CustomBoxItem extends StatelessWidget {
  const CustomBoxItem({
    super.key,
    this.withPaddingBottom,
    this.onTap,
    this.requester,
  });

  final bool? withPaddingBottom;
  final VoidCallback? onTap;
  final Map<String, dynamic>? requester;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      withMarginBottom: true,
      child: Row(
        children: [
          _avatar(),
          _mainInfo(),
          _sideInfo(),
        ],
      ),
    );
  }

  Widget _avatar() {
    return SizedBox(
      width: 60,
      child: CustomAvatar(imagePath: requester?['image']),
    );
  }

  Widget _mainInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              requester?['person'] ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryText
              ),
            ),
            SizedBox(height: 4),
            _score(),
            SizedBox(height: 4),
            _requestType(),
            SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _statusChip(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _requestType() {
    return Row(
      children: [
        Text(
          'Esta persona:', 
          style: TextStyle(fontSize: 12, color: AppColors.secondaryText)
        ),
        SizedBox(width: 4),
        Text(
          'Quiere ${requester?['requestType'] == 'digital' ? 'digital' : 'efectivo'}', 
          style: TextStyle(
            fontSize: 12, 
            fontWeight: FontWeight.bold, 
            color: AppColors.primaryText
          ),
        ),
      ],
    );
  }

  Widget _score() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 16),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            '${requester?['stars'] ?? 5} (${requester?['points'] ?? 100} pts.)',
            style: TextStyle(fontSize: 12, color: AppColors.fiveHundredGrey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            '| Completas: 2/5', 
            style: TextStyle(fontSize: 12, color: AppColors.fiveHundredGrey)
          )
        )
      ],
    );
  }

  Widget _statusChip() {
    return Chip(
      label: Text(
        requester?['status'] == 'pending' ? 'Pendiente' : 'Completada',
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.secondaryText,
        ),
      ),
      backgroundColor: Colors.green[50]!,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      side: BorderSide.none,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
  }

  Widget _sideInfo() {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'S/. ${requester?['amount'] ?? 50.00}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.primaryText,
            ),
          ),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 16),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'A ${requester?['distance'] ?? 0} mt. de tí',
                  style: TextStyle(fontSize: 12, color: AppColors.fourHundredGrey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
