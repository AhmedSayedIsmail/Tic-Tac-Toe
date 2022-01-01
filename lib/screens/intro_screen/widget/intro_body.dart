// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/shared/components/constants.dart';
import 'package:tic_tac_toe/shared/components/design_round_button.dart';
import 'package:tic_tac_toe/shared/components/design_text_field.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_states.dart';

class IntroBody extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  var player1Controller = TextEditingController();
  var player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacToeCubit, TicTacToeStates>(
        builder: (context, state) {
          var cubit = TicTacToeCubit.getCubit(context);
          return SafeArea(
              child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AvatarGlow(
                      endRadius: 140,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white70,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 1),
                      startDelay: Duration(seconds: 1),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/tic-tac-toe2.png"),
                        radius: 70,
                      )),
                  Text(
                    "Enter Player names",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          DesignTextField(
                            controller: player1Controller,
                            hint_text: "Player One",
                            type: TextInputType.name,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return kPlayeroneisEmpty;
                              } else if (value.length < 3) {
                                return kPlayeronelength;
                              } else {
                                return null;
                              }
                            },
                            obscure_text: false,
                            perfixImage: "assets/images/img1.png",
                          ),
                          DesignTextField(
                            controller: player2Controller,
                            hint_text: "Player Two",
                            type: TextInputType.name,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return kPlayertwoisEmpty;
                              } else if (value.length < 3) {
                                return kPlayertwolength;
                              } else {
                                return null;
                              }
                            },
                            obscure_text: false,
                            perfixImage: "assets/images/img-O2.png",
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  DesignRoundButton(
                    text: "Start Game".toUpperCase(),
                    onPress: () {
                      if (_formkey.currentState!.validate()) {
                        print("Let's go to play game");
                        cubit.startGame(
                            player1: player1Controller.text,
                            player2: player2Controller.text,
                            context: context);
                      }
                    },
                  )
                ],
              ),
            ),
          ));
        },
        listener: (context, state) {});
  }
}
