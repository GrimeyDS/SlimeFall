import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/app_state.dart';

void main() {
  runApp(const GameApp());
  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();
}

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  AppState createState() => AppState();
}


