// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/screens/game_screen/game_screen.dart';
import 'package:tic_tac_toe/shared/components/component_widget.dart';
import 'package:tic_tac_toe/shared/components/constants.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_states.dart';

class TicTacToeCubit extends Cubit<TicTacToeStates> {
  TicTacToeCubit() : super(InitialState());
  static TicTacToeCubit getCubit(context) => BlocProvider.of(context);
  String? xPlayer, oPlayer;
  bool exTurn = true;
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  void startGame({required player1, required player2, required context}) {
    emit(GoToGamePage());
    xPlayer = player1;
    oPlayer = player2;
    navigateAndFinish(context, const GameScreen());
  }

  void tapped({required index, required context}) {
    emit(TappedState());
    if (exTurn && displayExOh[index] == '') {
      displayExOh[index] = x;
      filledBoxes += 1;
      exTurn = !exTurn;
    } else if (!exTurn && displayExOh[index] == '') {
      displayExOh[index] = o;
      filledBoxes += 1;
      exTurn = !exTurn;
    } else if (displayExOh[index] != '') {
      exTurn = exTurn;
      print("The Box is Full You Click in wrong Place");
    }
    checkWinner(context: context);
  }

  void checkWinner({context}) {
    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      showWinDialog(winner: displayExOh[0], context: context);
    }

    // checks 2nd row
    else if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      showWinDialog(winner: displayExOh[3], context: context);
    }

    // checks 3rd row
    else if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      showWinDialog(winner: displayExOh[6], context: context);
    }

    // checks 1st column
    else if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      showWinDialog(winner: displayExOh[0], context: context);
    }

    // checks 2nd column
    else if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      showWinDialog(winner: displayExOh[1], context: context);
    }

    // checks 3rd column
    else if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      showWinDialog(winner: displayExOh[2], context: context);
    }

    // checks diagonal
    else if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      showWinDialog(winner: displayExOh[6], context: context);
    }

    // checks diagonal
    else if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      showWinDialog(winner: displayExOh[0], context: context);
    } else if (filledBoxes == 9) {
      showDrawDialog(context);
    } else {
      //make any thing here
    }
  }

  void showWinDialog({winner, context}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + winner),
            actions: <Widget>[
              FlatButton(
                child: const Text('Play Again!'),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    if (winner == o) {
      ohScore += 1;
    } else if (winner == x) {
      exScore += 1;
    }
  }

  void showDrawDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('DRAW'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Play Again!'),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void clearBoard() {
    emit(ClearState());
    for (int i = 0; i < 9; i++) {
      displayExOh[i] = '';
    }
    filledBoxes = 0;
    exTurn = true;
  }
}
