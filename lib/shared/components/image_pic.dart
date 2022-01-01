// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe/shared/cubit/tic_tac_toe_states.dart';

class ImagePic extends StatelessWidget {
  String image;
  Color color;
  ImagePic({required this.image, required this.color});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacToeCubit, TicTacToeStates>(
        builder: (context, state) {
          var cubit = TicTacToeCubit.getCubit(context);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 35),
            child: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 9, color: color),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/image2.png"))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green.shade400),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(image),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
