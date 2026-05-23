import 'package:flutter/material.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Perfil',
      automaticallyImplyLeading: false,
      body: Center(
        child: Text('Perfil'),
      ),
    );
  }
}