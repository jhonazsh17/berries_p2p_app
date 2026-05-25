import 'package:flutter/material.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_box_item.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/request_detail.dart';
import 'package:berries_p2p_app/features/new_request_money/presentation/screens/new_request_money.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  List<Map<String, dynamic>> get requesters => [
    {'person': 'Monkey D. Luffy', 'amount': 100, 'distance': 10, 'points': 5, 'stars': 5, 'requestType': 'cash', 'image': 'assets/images/luffy-nika.png'},
    {'person': 'Roronoa Zoro', 'amount': 200, 'distance': 20, 'points': 10, 'stars': 4, 'requestType': 'digital', 'image': 'assets/images/zoro.png'},
    {'person': 'Nami', 'amount': 300, 'distance': 30, 'points': 15, 'stars': 3, 'requestType': 'cash', 'image': 'assets/images/nami.png'},
    {'person': 'Sanji', 'amount': 400, 'distance': 40, 'points': 20, 'stars': 2, 'requestType': 'digital', 'image': 'assets/images/sanji.png'},
    {'person': 'Tony T. Chopper', 'amount': 500, 'distance': 50, 'points': 25, 'stars': 1, 'requestType': 'cash', 'image': 'assets/images/chopper.png'},
    {'person': 'Nico Robin', 'amount': 600, 'distance': 60, 'points': 30, 'stars': 5, 'requestType': 'digital', 'image': 'assets/images/robin.png'},
    {'person': 'Franky', 'amount': 700, 'distance': 70, 'points': 35, 'stars': 4, 'requestType': 'cash', 'image': 'assets/images/franki.png'},
    {'person': 'Brook', 'amount': 800, 'distance': 80, 'points': 40, 'stars': 3, 'requestType': 'digital', 'image': 'assets/images/brook.png'},
    {'person': 'Jinbe', 'amount': 900, 'distance': 90, 'points': 45, 'stars': 2, 'requestType': 'cash', 'image': 'assets/images/jinbe.png'},
    {'person': 'Usopp', 'amount': 1000, 'distance': 100, 'points': 50, 'stars': 1, 'requestType': 'digital', 'image': 'assets/images/usopp.png'},
  ];

  List<Widget> _buildCustomBoxItems(BuildContext context) {
    final requesters = this.requesters;
    return List.generate(requesters.length, (index) {
      return CustomBoxItem(
        withPaddingBottom: true,
        requester: requesters[index],
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RequestDetail(requester: requesters[index])));
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