import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:ecommerce_app/features/auth/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  AuthenticationScreenState createState() => AuthenticationScreenState();
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    LoginScreen(),
    RegisterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavLink('Login', 0),
            const SizedBox(width: 20),
            _buildNavLink('Register', 1),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }

  Widget _buildNavLink(String label, int index) {
    final isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Stack(
          children: [
            // Text
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Underline
            if (isActive)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
