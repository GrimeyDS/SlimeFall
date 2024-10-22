import 'package:flutter/material.dart';

class SwitchPageTextButton extends TextButton {
  SwitchPageTextButton({super.key, required String text, required VoidCallback super.onPressed})
      : super(
        
          child: Text(text, 
            style: const TextStyle(color: Colors.blue, fontSize: 20),
          ),
        );
}