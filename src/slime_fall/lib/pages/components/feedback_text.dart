import 'package:flutter/material.dart';
import 'package:slime_fall/services/authentication/authentication_constants.dart';

class FeedbackText extends Padding {

  FeedbackText({super.key, required String message})
      : super(
          padding: const EdgeInsets.all(8.0),
          child: Text(message,
              style: TextStyle(
                color: message.contains(AuthConstants.succes) ?
                Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),),
        );
}