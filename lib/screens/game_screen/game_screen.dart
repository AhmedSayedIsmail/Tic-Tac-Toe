import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/screens/game_screen/widget/game_body.dart';
import 'package:tic_tac_toe/shared/components/constants.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GameBody(),
    );
  }
}
