import 'package:flutter/material.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Mensajes',
      automaticallyImplyLeading: false,
      body: Center(
        child: Text('Mensajes'),
      ),
    );
  }
}