import 'package:flutter/material.dart';

class AuthMobileLoginPage extends StatelessWidget {
  const AuthMobileLoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feature: auth/mobile_login')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_tree, size: 72),
            SizedBox(height: 12),
            Text('Feature stub ready. Implement domain/data/presentation.'),
          ],
        ),
      ),
    );
  }
}
