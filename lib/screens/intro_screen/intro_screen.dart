import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/intro_screen/widget/intro_body.dart';
import 'package:tic_tac_toe/shared/components/constants.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackground,
      body: IntroBody(),
    );
  }
}
