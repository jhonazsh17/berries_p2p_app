import 'package:flutter/material.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_avatar.dart';
import 'package:berries_p2p_app/shared/widgets/custom_card.dart';
import 'package:berries_p2p_app/shared/widgets/payment_status_chip.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAvatar(imagePath: requester?['image']),
              _mainInfo(),
              _sideInfo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mainInfo() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              requester?['person'] ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '${requester?['stars'] ?? 5} (${requester?['points'] ?? 100} pts.)',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _requestTypeChip(),
                const SizedBox(width: 6),
                if (requester?['status'] case final String status) ...[
                  PaymentStatusChip(
                    status: PaymentStatus.values.byName(status),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _requestTypeChip() {
    return Chip(
      label: Text(
        'Quiere ${requester?['requestType'] == 'digital' ? 'digital' : 'efectivo'}',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
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
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 16),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'A ${requester?['distance'] ?? 0} mt. de tí',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ),
            ],
          ),
          SizedBox(height: 36),
          Text(
            'S/. ${requester?['amount'] ?? 50.00}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
