// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/shared/components/constants.dart';

class DesignTextField extends StatelessWidget {
  final String? hint_text;
  final String? Function(String?)? validation;
  final TextInputType? type;
  final TextEditingController? controller;
  final bool? obscure_text;
  final String? perfixImage;
  final IconData? suffixIcon;
  final Function()? suffixOnClick;
  const DesignTextField(
      {Key? key,
      this.hint_text,
      this.validation,
      this.type,
      this.controller,
      this.obscure_text,
      this.perfixImage,
      this.suffixIcon,
      this.suffixOnClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        maxLength: 10,
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          hintText: hint_text,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: backgroundColor,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 3)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade800, width: 5)),
          errorStyle: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              perfixImage!,
              width: 20,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
          suffixIcon:
              IconButton(onPressed: suffixOnClick, icon: Icon(suffixIcon)),
        ),
        validator: validation,
        keyboardType: type,
        controller: controller,
        obscureText: obscure_text!,
      ),
    );
  }
}
