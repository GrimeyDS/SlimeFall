import 'package:flutter/material.dart';

class GameAppBar extends AppBar {
  GameAppBar({super.key, required String title})
      : super(
          title: Text(title),
          foregroundColor: Colors.lightBlue,
          backgroundColor: Colors.black,
        );
}