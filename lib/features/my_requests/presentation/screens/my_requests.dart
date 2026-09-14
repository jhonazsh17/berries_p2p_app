import 'package:flutter/material.dart';
import 'package:berries_p2p_app/features/my_requests/presentation/screens/request_list.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({super.key});

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Mis Solicitudes',
      withBottomNavigation: false,
      body: RequestList(),
    );
  }
}
