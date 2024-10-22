import 'package:flutter/material.dart';
import 'package:slime_fall/pages/components/app_bar.dart';
import 'package:slime_fall/pages/components/email_textfield.dart';
import 'package:slime_fall/pages/components/feedback_text.dart';
import 'package:slime_fall/pages/components/password_textfield.dart';
import 'package:slime_fall/pages/components/submit_button.dart';
import 'package:slime_fall/pages/components/text_button.dart';
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
      appBar: GameAppBar(title: AuthConstants.register),
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
                EmailTextfield(controller: emailController),
                const SizedBox(height: 10),

                PasswordTextfield(controller: passwordController),
                const SizedBox(height: 20),

                if (errorMessage.isNotEmpty)
                  FeedbackText(message: errorMessage),

                SubmitButton(text: AuthConstants.register, onPressed: () { onRegister(emailController.text, passwordController.text); },),

                SwitchPageTextButton(text: AuthConstants.toLoginMessage, onPressed: onSwitchToLogin,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
