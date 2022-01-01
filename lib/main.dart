// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/screens/intro_screen/intro_screen.dart';
import 'package:tic_tac_toe/shared/bloc_observer.dart';
import 'package:tic_tac_toe/shared/components/constants.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kInactiveCardColor,
      systemNavigationBarColor: kInactiveCardColor,
    ),
  );
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TicTacToeCubit()),
      ],
      child: MaterialApp(
        title: 'Tic Tac Toe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
      ),
    );
  }
}
