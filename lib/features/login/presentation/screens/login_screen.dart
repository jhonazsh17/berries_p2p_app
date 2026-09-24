import 'package:berries_p2p_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/home.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  Text(
                    AppStrings.appName,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    AppStrings.appMessage,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  SizedBox(height: 48),
                  ..._inputs(),
                  SizedBox(height: 32),
                  _button(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateToHome(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
      child: Text(
        AppStrings.loginButtonText,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  List<Widget> _inputs() {
    return [
      _input(AppStrings.emailInputPlaceholder),
      SizedBox(height: 16),
      _input(AppStrings.passwordInputPlaceholder, isObscureText: true),
    ];
  }

  Widget _input(String text, {bool isObscureText = false}) {
    OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primaryGrey, width: 1),
    );

    return TextField(
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: AppColors.secondaryText),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
      ),
    );
  }
}
