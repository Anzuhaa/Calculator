// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextfield extends StatelessWidget {
  final String text;
  final String label;
  final Color? colors;
  final TextEditingController controller;

  const MyTextfield({
    super.key,
    required this.text,
    required this.label,
    required this.controller,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        style: TextStyle(
          fontFamily: 'MontserratSemi',
          color: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF32323c),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Color(0xFF1b1b23),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Color(0xFF1b1b23),
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFFf3f3f3),
            )),
        controller: controller,
      ),
    );
  }
}
