// ignore_for_file: prefer_const_constructors, duplicate_import

import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../Redux/state.dart';

class MyPersegiPage extends StatefulWidget {
  const MyPersegiPage({super.key});

  @override
  State<MyPersegiPage> createState() => _MyPersegiPageState();
}

class _MyPersegiPageState extends State<MyPersegiPage> {
  final TextEditingController _Value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StoreProvider<StateBangunDatar>(
      store: storeBangunDatar,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xFFF3F3F3),
          ),
          title: MyText(
            text: 'Persegi',
            fontsize: 24,
            fontfamily: 'MontserratBold',
            color: Color(0xFFF3F3F3),
          ),
          backgroundColor: Color(0xff1c1d22),
        ),
        backgroundColor: Color(0xff1c1d22),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextfield(text: "", label: "Sisi Persegi", controller: _Value),
              MyTextbutton(
                text: "Hitung Keliling",
                onPressed: () {
                  final side = double.tryParse(_Value.text) ?? 0.0;
                  StoreProvider.of<StateBangunDatar>(context)
                      .dispatch(CalculateSquareValue(side));
                },
                backgroundColor: Color(0xFF5865f2),
                textColor: Color(0xFFf3f3f3),
              ),
              StoreConnector<StateBangunDatar, double>(
                converter: (store) => store.state.value,
                builder: (context, value) => MyText(
                  text: "Hasil $value",
                  fontsize: 20,
                  fontfamily: 'Montserrat',
                  color: Color(0xfff3f3f3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
