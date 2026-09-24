import 'package:flutter/material.dart';
import 'package:berries_p2p_app/features/login/presentation/screens/login.dart';
import 'package:berries_p2p_app/core/constants/app_strings.dart';

const _splashDuration = Duration(seconds: 3);

final List<Map> texts = [
  {"value": AppStrings.appName, "size": 48, "fontWeight": FontWeight.bold},
  {"value": AppStrings.appMessage, "size": 16, "fontWeight": FontWeight.normal},
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPresentationTexts(),
        ),
      ),
    );
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(_splashDuration);

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  List<Widget> _buildPresentationTexts() {
    return [
      for (final text in texts)
        Text(
          text['value'],
          style: TextStyle(
            fontSize: text['size'],
            fontWeight: text['fontWeight'],
          ),
        ),
    ];
  }
}
