import 'package:flutter/material.dart';
import 'package:slime_fall/services/authentication/authentication_constants.dart';

class EmailTextfield extends TextField {
  const EmailTextfield({super.key, required TextEditingController controller,}) 
  : super(
          controller: controller,
          style: const TextStyle(color: Colors.blue),
          decoration: const InputDecoration(
            labelText: AuthConstants.email,
            labelStyle: TextStyle(color: Colors.blue),
            hintText: AuthConstants.enterEmail,
            hintStyle: TextStyle(color: Colors.blue),
            fillColor: Colors.blue,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        );
}