import 'package:flutter/material.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_box_item.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/request_detail.dart';
import 'package:berries_p2p_app/features/new_request_money/presentation/screens/new_request_money.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  List<Widget> _buildCustomBoxItems(BuildContext context) {
    return List.generate(10, (index) {
      return CustomBoxItem(
        withPaddingBottom: true,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RequestDetail()));
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      automaticallyImplyLeading: false,
      onFabPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewRequestMoney()));
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Solicitudes cercanas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ..._buildCustomBoxItems(context),
            ],
          ),
        ),
      ),
    );
  }
}