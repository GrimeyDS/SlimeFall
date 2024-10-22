import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/game/overlays/dash_cooldown_overlay.dart';
import 'package:slime_fall/pages/login_page.dart';
import 'package:slime_fall/pages/register_page.dart';
import 'package:slime_fall/game/slime_fall_game.dart';
import 'package:slime_fall/game/overlays/score_overlay.dart';
import 'package:slime_fall/main.dart';
import 'package:slime_fall/game/constants/configuration.dart';

class AppState extends State<GameApp> {
  bool isLoggedIn = false;
  bool isRegistering = false;

  void handleLogin(String email, String password) {
    // Add service to login user
    setState(() {
      isLoggedIn = true;
    });
  }

  void handleRegister(String email, String password) {
    // Add service to register user
    setState(() {
      isLoggedIn = true;
    });
  }

  void switchToRegister() {
    setState(() {
      isRegistering = true;
    });
  }

  void switchToLogin() {
    setState(() {
      isRegistering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slime Fall',
      home: Scaffold(
        body: 
              isLoggedIn ?

                  GameWidget(
                  game: SlimeFallGame(),
                  overlayBuilderMap: {
                    Config.dashCooldownOverlay: (_, SlimeFallGame game) => DashCooldownOverlay(game: game),
                    Config.scoreOverlay: (_, SlimeFallGame game) => ScoreOverlay(game: game),
                  },
                )

              : isRegistering ?

                    RegisterPage(
                      onRegister: handleRegister,
                      onSwitchToLogin: switchToLogin,
                    )
                  : LoginPage(
                      onLogin: handleLogin,
                      onSwitchToRegister: switchToRegister,
                    ),
      ),
    );
  }
}