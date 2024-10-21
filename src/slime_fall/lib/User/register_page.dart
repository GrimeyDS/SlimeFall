import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final Function(String, String) onRegister; // Callback funtion but with parameters
  final VoidCallback onSwitchToLogin;

  const RegisterPage({
    super.key,
    required this.onRegister,
    required this.onSwitchToLogin,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                onRegister(email, password);
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: onSwitchToLogin,
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
