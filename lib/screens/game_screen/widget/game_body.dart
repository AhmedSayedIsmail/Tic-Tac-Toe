// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/screens/game_screen/widget/button_design.dart';
import 'package:tic_tac_toe/screens/intro_screen/intro_screen.dart';
import 'package:tic_tac_toe/shared/components/component_widget.dart';
import 'package:tic_tac_toe/shared/components/constants.dart';
import 'package:tic_tac_toe/shared/components/image_pic.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_states.dart';

class GameBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: BlocProvider.of<TicTacToeCubit>(context),
      child: BlocConsumer<TicTacToeCubit, TicTacToeStates>(
          builder: (context, state) {
            var cubit = TicTacToeCubit.getCubit(context);
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImagePic(
                        image: "assets/images/img1.png",
                        color: cubit.exTurn ? Colors.pink : Colors.white,
                      ), //this X image
                      ImagePic(
                        image: "assets/images/img-O2.png",
                        color: cubit.exTurn ? Colors.white : Colors.amber,
                      ), //this O image
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 35),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink)),
                          child: Text(
                            "${cubit.xPlayer}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellow)),
                          child: Text("${cubit.oPlayer}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            "${cubit.exScore}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 35),
                          child: Text(":",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          child: Text("${cubit.ohScore}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: boardWidth,
                      height: boardWidth,
                      decoration: BoxDecoration(
                        color: backgroundofBoxs,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: GridView.count(
                        crossAxisCount: 9 ~/
                            3, // the ~/ operator allows you to evide to integer and return an Int as a result
                        padding: EdgeInsets.all(5.0),
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        children: List.generate(9, (index) {
                          return InkWell(
                            onTap: () {
                              cubit.tapped(index: index, context: context);
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: backgroundofBox,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: Text(
                                  cubit.displayExOh[index],
                                  style: TextStyle(
                                      fontSize: 64.0,
                                      fontWeight: FontWeight.bold,
                                      color: cubit.displayExOh[index] == x
                                          ? Colors.pink
                                          : Colors.amber),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DesignButton(
                        onTap: () {
                          cubit.clearBoard();
                          cubit.exScore = 0;
                          cubit.ohScore = 0;
                        },
                        imagePath: "assets/images/Repeat.png",
                      ),
                      DesignButton(
                        onTap: () {
                          cubit.exScore = 0;
                          cubit.ohScore = 0;
                          navigateAndFinish(context, IntroScreen());
                        },
                        imagePath: "assets/images/exit.png",
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ));
          },
          listener: (context, state) {}),
    );
  }
}
