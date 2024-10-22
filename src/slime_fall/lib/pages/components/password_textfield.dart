import 'package:flutter/material.dart';
import 'package:slime_fall/services/authentication/authentication_constants.dart';

class PasswordTextfield extends TextField {
  const PasswordTextfield({super.key, required TextEditingController super.controller})
      : super(
          style: const TextStyle(color: Colors.blue),
          obscureText: true,
          decoration: const InputDecoration(
            labelText: AuthConstants.password,
            labelStyle: TextStyle(color: Colors.blue),
            hintText: AuthConstants.enterPassword,
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