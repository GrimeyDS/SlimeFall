import 'package:flutter/material.dart';

class GameTitle extends Text{
  const GameTitle({Key? key, required String title}) 
  : super(title, key: key, 
          style: const TextStyle(
            fontSize: 40, 
            fontWeight: FontWeight.bold, 
            color: Colors.white));
}