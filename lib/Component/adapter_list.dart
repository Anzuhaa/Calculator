// ignore_for_file: prefer_const_constructors

import 'package:calculator_redux/Models/model_content.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:flutter/material.dart';

class AdapterList extends StatelessWidget {
  final ModelContent modelContent;

  const AdapterList({
    super.key,
    required this.modelContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: MyTextbutton(
        text: modelContent.name,
        onPressed: modelContent.action,
        backgroundColor: Color(0xFF32323c),
        textColor: Color(0xfff3f3f3),
      ),
    );
  }
}
