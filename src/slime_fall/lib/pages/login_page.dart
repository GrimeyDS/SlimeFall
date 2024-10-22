import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Function(String, String) onLogin; // Callback function with parameters
  final VoidCallback onSwitchToRegister;
  final String errorMessage;

  const LoginPage({
    super.key,
    required this.onLogin,
    required this.onSwitchToRegister,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
            // Check if errorMessage is not empty and display the error
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.red, // Style the error message in red
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                onLogin(email, password);
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: onSwitchToRegister,
              child: const Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
