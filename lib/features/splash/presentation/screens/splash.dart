import 'package:flutter/material.dart';
import 'package:berries_p2p_app/features/login/presentation/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Berries', 
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Conecta - Intercambia - Confía',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}