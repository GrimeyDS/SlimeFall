import 'package:flutter/material.dart';

class DashCooldownOverlay extends StatelessWidget {
  static const String id = 'DashCooldownOverlay';
  final double cooldownProgress;
  final Color foreGroundColor = Colors.blue;
  final Color backgroundColor = Colors.white;

  // ignore: prefer_const_constructors_in_immutables, use_super_parameters
  DashCooldownOverlay({Key? key, required this.cooldownProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: cooldownProgress,
              strokeWidth: 6,
              backgroundColor: backgroundColor,
              valueColor: AlwaysStoppedAnimation(foreGroundColor),
            ),
          )
        ]
      ),
    );
  }
}