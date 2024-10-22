import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/game/overlays/dash_cooldown_overlay.dart';
import 'package:slime_fall/pages/login_page.dart';
import 'package:slime_fall/pages/register_page.dart';
import 'package:slime_fall/game/slime_fall_game.dart';
import 'package:slime_fall/game/overlays/score_overlay.dart';
import 'package:slime_fall/main.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/services/authentication/authentication_service.dart';

class AppState extends State<GameApp> {
  bool isLoggedIn = false;
  bool isRegistering = false;
  bool isLoading = false;
  String errorMessage = '';

  final AuthenticationService authService = AuthenticationService();

  Future<void> handleLogin(String email, String password) async {
    try {
      bool result = await authService.login(email: email, password: password);
      if (result) {
        setState(() {
          isLoggedIn = true;
          errorMessage = '';
        });
      }
    }
    catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> handleRegister(String email, String password) async {
    try {
      bool result = await authService.register(email: email, password: password);
      if (result) {
        setState(() {
          isRegistering = false;
          errorMessage = 'Registration successful, please login!';
        });
      }
    }
    catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  void switchToRegister() {
    setState(() {
      errorMessage = '';
      isRegistering = true;
    });
  }

  void switchToLogin() {
    setState(() {
      errorMessage = '';
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
                      errorMessage: errorMessage
                    )
                  : LoginPage(
                      onLogin: handleLogin,
                      onSwitchToRegister: switchToRegister,
                      errorMessage: errorMessage
                    ),
      ),
    );
  }
}