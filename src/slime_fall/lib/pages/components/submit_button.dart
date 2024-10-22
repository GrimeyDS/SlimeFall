import 'package:flutter/material.dart';

class SubmitButton extends ElevatedButton {
  SubmitButton({super.key, required String text, required VoidCallback super.onPressed})
      : super(
          child: Text(text, 
            style: const TextStyle(color: Colors.blue, fontSize: 20),
          ),
        );
}