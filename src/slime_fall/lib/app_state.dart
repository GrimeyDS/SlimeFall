import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/game/overlays/dash_cooldown_overlay.dart';
import 'package:slime_fall/game/overlays/game_over_overlay.dart';
import 'package:slime_fall/game/overlays/start_screen_overlay.dart';
import 'package:slime_fall/pages/login_page.dart';
import 'package:slime_fall/pages/register_page.dart';
import 'package:slime_fall/game/slime_fall_game.dart';
import 'package:slime_fall/game/overlays/score_overlay.dart';
import 'package:slime_fall/main.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/services/authentication/authentication_constants.dart';
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
      final loggedUser = authService.currentUser;
      if (loggedUser != null) { 
        // safe data
      }
      else {
        setState(() {
          errorMessage = AuthConstants.userNotFound;
        });
      }
    }
    catch (e) {
      setState(() {
        errorMessage = e.toString().replaceAll(AuthConstants.exceptionError, '');
        if (errorMessage.contains(AuthConstants.internalError)) {
          errorMessage = AuthConstants.standardLoginError;
        }
      });
    }
  }

  Future<void> handleRegister(String email, String password) async {
    try {
      bool result = await authService.register(email: email, password: password);
      if (result) {
        setState(() {
          isRegistering = false;
          errorMessage = AuthConstants.registerSuccess;
        });
      }
    }
    catch (e) {
      setState(() {
        errorMessage = e.toString().replaceAll(AuthConstants.exceptionError, '');
        if (errorMessage.contains(AuthConstants.internalError)) {
          errorMessage = AuthConstants.standardRegisterError;
        }
      });
    }
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

  void showHighScores() {
    // show high scores
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
                    Config.startScreenOverlay: (_, SlimeFallGame game) => StartScreenOverlay(onStart: game.startGame),
                    Config.gameOverOverlay: (_, SlimeFallGame game) => GameOverOverlay(onReset: game.resetGame, onShowHighScores: showHighScores),
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