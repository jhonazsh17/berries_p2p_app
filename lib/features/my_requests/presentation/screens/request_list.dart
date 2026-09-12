import 'package:flutter/material.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_box_item.dart';
import 'package:berries_p2p_app/shared/widgets/custom_button.dart';

class RequestList extends StatefulWidget {
  const RequestList({super.key});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    final requester = {
      'person': 'John Doe',
      'amount': 100,
      'distance': 10,
      'points': 10,
      'stars': 10,
      'requestType': 'cash',
      'image': 'assets/images/john_doe.png',
    };

    return MainLayout(
      title: 'Mis Solicitudes',
      withBottomNavigation: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CustomButton(
                  text: 'Propias',
                  textColor: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                CustomButton(
                  text: 'Aceptadas por mí ',
                  textColor: Colors.black,
                  outlined: true,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomBoxItem(
              withPaddingBottom: true,
              requester: requester,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
