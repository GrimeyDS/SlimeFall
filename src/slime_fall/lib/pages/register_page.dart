import 'package:flutter/material.dart';
import 'package:slime_fall/game/constants/assets.dart';
import 'package:slime_fall/services/authentication/authentication_constants.dart';

class RegisterPage extends StatelessWidget {
  final Function(String, String) onRegister; // Callback function for registering
  final VoidCallback onSwitchToLogin;
  final String errorMessage;

  const RegisterPage({
    super.key,
    required this.onRegister,
    required this.onSwitchToLogin,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                  decoration: const InputDecoration(labelText: AuthConstants.email),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: AuthConstants.password),
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
        ],
      ),
    );
  }
}
