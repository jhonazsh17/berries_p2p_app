import 'package:flutter/material.dart';

enum PaymentStatus { completed, pending, expired }

class PaymentStatusChip extends StatelessWidget {
  const PaymentStatusChip({super.key, required this.status});

  final PaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, icon, background, foreground) = switch (status) {
      PaymentStatus.completed => (
        'Completada',
        Icons.check_circle_outline_rounded,
        const Color(0xFFDDF7E8),
        const Color(0xFF167449),
      ),
      PaymentStatus.pending => (
        'Pendiente',
        Icons.access_time_rounded,
        const Color(0xFFFFF2CC),
        const Color(0xFF976300),
      ),
      PaymentStatus.expired => (
        'Expirada',
        Icons.cancel_outlined,
        const Color(0xFFFCE1E1),
        const Color(0xFFB13A3A),
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: foreground),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
