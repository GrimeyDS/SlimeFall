import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:slime_fall/app_state.dart';
import 'package:slime_fall/services/authentication/authentication_service.dart';
import 'package:slime_fall/services/authentication/authentication_service_interface.dart';
import 'package:slime_fall/services/authentication/highscore/highscore_service.dart';
import 'package:slime_fall/services/authentication/highscore/highscore_service_interface.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerSingleton<IAuthenticationService>(AuthenticationService());
  getIt.registerSingleton<IHighscoreService>(HighscoreService());
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
  runApp(const GameApp());
  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();
}

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  AppState createState() => AppState();
}


