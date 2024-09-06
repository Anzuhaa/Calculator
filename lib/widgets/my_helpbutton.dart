// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyHelpbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyHelpbutton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 4, bottom: 2),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xff1c1d22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'MontserratSemi',
            color: Color(0xFF2891d5),
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
