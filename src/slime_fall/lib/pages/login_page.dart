import 'package:flutter/material.dart';
import 'package:slime_fall/services/authentication/authentication_constants.dart';

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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AuthConstants.background,
              fit: BoxFit.fill,
            ),
          ),

          // Form
          Padding(
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
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                        color: errorMessage.contains('Success') ?
                          Colors.green : Colors.red,
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
        ],
      ),
    );
  }
}
