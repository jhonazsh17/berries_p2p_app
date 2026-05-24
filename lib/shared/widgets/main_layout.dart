import 'package:flutter/material.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/home.dart';
import 'package:berries_p2p_app/features/my_requests/presentation/screens/my_requests.dart';
import 'package:berries_p2p_app/features/messages/presentation/screens/messages.dart';
import 'package:berries_p2p_app/features/profile/presentation/screens/profile.dart';

class MainLayout extends StatefulWidget {
  final String? title;
  final bool withBottomNavigation;
  final bool withAppBar;
  final VoidCallback? onFabPressed;
  final Widget? body;
  final bool? automaticallyImplyLeading;

  const MainLayout({
    super.key,
    this.title = '',
    this.withBottomNavigation = true,
    this.withAppBar = true,   
    this.onFabPressed,
    required this.body,
    this.automaticallyImplyLeading = true,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  final Color colorPrimary = AppColors.primary;
  final List<Map<String, dynamic>> _navigationMap = [
    {'label': 'Home', 'icon': Icons.home_filled},
    {'label': 'Mis Solicitudes', 'icon': Icons.list_alt},
    {'label': 'Mensajes', 'icon': Icons.message_outlined},
    {'label': 'Perfil', 'icon': Icons.person_outline},
  ];
  final List<Widget> _screens = [
    const Home(),
    const MyRequests(),
    const Messages(),
    const Profile(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF8EE),

      appBar: widget.withAppBar ? AppBar(
        foregroundColor: Colors.white,
        title: widget.title != '' ? Text(
          widget.title!,
          style: const TextStyle(fontSize: 18),
        ) : null,
        backgroundColor: colorPrimary,
        elevation: 0,
        automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ) : null,

      body: widget.body,

      floatingActionButton: widget.withBottomNavigation && widget.onFabPressed != null
        ? FloatingActionButton(
            onPressed: widget.onFabPressed,
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            mini: true,
            child: Icon(
              Icons.add,
              color: colorPrimary,
              size: 20,
            ),
          )
        : null,

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      bottomNavigationBar: widget.withBottomNavigation
        ? BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            selectedItemColor: colorPrimary,
            unselectedItemColor: Colors.grey,

            onTap: (index) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => _screens[index]));
            },

            items: _navigationButtons(),
            backgroundColor: Colors.white,
          )
        : null,
    );
  }

  List<BottomNavigationBarItem> _navigationButtons() {
    List<BottomNavigationBarItem> items = [];
    for (var item in _navigationMap) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(item['icon'], size: 20),
          label: item['label'],
        ),
      );
    }
    return items;
  }
}


