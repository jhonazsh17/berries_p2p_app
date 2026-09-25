import 'package:berries_p2p_app/shared/widgets/custom_box_item.dart';
import 'package:flutter/material.dart';
import 'package:berries_p2p_app/shared/widgets/custom_button.dart';
import 'package:berries_p2p_app/shared/widgets/custom_card.dart';
import 'package:berries_p2p_app/shared/widgets/payment_status_chip.dart';

final buttonList = [
  {
    'id': 'owner',
    'text': 'Propias',
    'active': true,
    'outlined': false,
    'withMarginRight': true,
  },
  {
    'id': 'accepted',
    'text': 'Aceptadas por mí',
    'active': false,
    'outlined': true,
    'withMarginRight': false,
  },
];

class RequestList extends StatefulWidget {
  const RequestList({super.key});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  String _type = 'owner';
  List<Map<String, dynamic>> _currentButtonList = buttonList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              ..._buttons(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PopupMenuButton<String>(
                    color: Colors.white,
                    offset: const Offset(0, 40),
                    icon: const Icon(Icons.filter_list),
                    onSelected: (value) {},
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'all', child: Text('Todas')),
                      PopupMenuItem(
                        value: 'completed',
                        child: Text('Completadas'),
                      ),
                      PopupMenuItem(
                        value: 'pending',
                        child: Text('Pendientes'),
                      ),
                      PopupMenuItem(value: 'expired', child: Text('Expiradas')),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _type == 'owner' ? _ownerRequests() : _acceptedRequests(),
        ],
      ),
    );
  }

  List<Widget> _buttons() {
    return _currentButtonList
        .map(
          (button) => CustomButton(
            text: button['text'] as String,
            textColor: Colors.black,
            active: button['active'] as bool,
            outlined: button['outlined'] as bool,
            withMarginRight: button['withMarginRight'] as bool,
            onPressed: () {
              setState(() {
                _type = button['id'] as String;
                _currentButtonList = _currentButtonList.map((button) {
                  return {
                    ...button,
                    'active': button['id'] == _type,
                    'outlined': button['id'] != _type,
                  };
                }).toList();
              });
            },
          ),
        )
        .toList();
  }

  Widget _ownerRequests() {
    final requester = {
      'person': 'John Doe',
      'amount': 1000,
      'distance': 10,
      'points': 10,
      'stars': 10,
      'requestType': 'cash',
      'requestDate': '12/09/2026',
      'status': 'pending',
    };

    final requester2 = {
      'person': 'John Doe',
      'amount': 2000,
      'distance': 10,
      'points': 10,
      'stars': 10,
      'requestType': 'digital',
      'requestDate': '12/09/2026',
      'status': 'completed',
    };

    final requester3 = {
      'person': 'John Doe',
      'amount': 2000,
      'distance': 10,
      'points': 10,
      'stars': 10,
      'requestType': 'digital',
      'requestDate': '12/09/2026',
      'status': 'completed',
    };

    final requester4 = {
      'person': 'John Doe',
      'amount': 3000,
      'distance': 10,
      'points': 10,
      'stars': 10,
      'requestType': 'cash',
      'requestDate': '12/09/2026',
      'status': 'expired',
    };

    final list = [requester, requester2, requester3, requester4];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...list.map((requester) => _itemRequest(requester))],
    );
  }

  Widget _acceptedRequests() {
    final requester = {
      'person': 'John Doe',
      'amount': 1000,
      'distance': 10,
      'points': 10,
      'stars': 10,
      'requestType': 'cash',
      'requestDate': '12/09/2026',
      'status': 'completed',
    };

    final requester2 = {
      'person': 'John Doe',
      'amount': 2000,
      'distance': 10,
      'points': 10,
      'stars': 10,
      'requestType': 'digital',
      'requestDate': '12/09/2026',
      'status': 'pending',
    };

    final list = [requester, requester2];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...list.map(
          (requester) => CustomBoxItem(
            withPaddingBottom: true,
            requester: requester,
            onTap: () {
              // action
            },
          ),
        ),
      ],
    );
  }

  Widget _itemRequest(Map<String, dynamic> requester) {
    final isDigital = requester['requestType'] == 'digital';
    final modality = isDigital ? 'En digital' : 'En efectivo';

    return CustomCard(
      withMarginBottom: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'S/. ${requester['amount']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      requester['requestDate'] ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _chip(modality),
              const SizedBox(height: 8),
              PaymentStatusChip(
                status: PaymentStatus.values.byName(
                  requester['status'] as String,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String modality) {
    return Chip(
      label: Text(
        modality,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey[200]!,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      side: BorderSide.none,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
}
