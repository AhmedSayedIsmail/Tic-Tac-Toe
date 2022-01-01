// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class DesignButton extends StatelessWidget {
  String imagePath;
  VoidCallback onTap;
  DesignButton({required this.imagePath, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey,
          ),
          child: Image(
            image: AssetImage(
              imagePath,
            ),
            width: 20,
            height: 20,
          )),
      onTap: onTap,
    );
  }
}
