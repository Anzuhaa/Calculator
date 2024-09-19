// ignore_for_file: prefer_const_constructors

import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../Redux/state.dart';

class MyPersegiPanjangPage extends StatefulWidget {
  const MyPersegiPanjangPage({super.key});

  @override
  State<MyPersegiPanjangPage> createState() => _MyPersegiPanjangPageState();
}

class _MyPersegiPanjangPageState extends State<MyPersegiPanjangPage> {
  final TextEditingController _Value1 = TextEditingController();
  final TextEditingController _Value2 = TextEditingController();

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
            text: 'Persegi Panjang',
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
              MyTextfield(text: "", label: "Panjang", controller: _Value1),
              MyTextfield(text: "", label: "Lebar", controller: _Value2),
              MyTextbutton(
                text: "Hitung Keliling",
                onPressed: () {
                  final length = double.tryParse(_Value1.text) ?? 0.0;
                  final width = double.tryParse(_Value2.text) ?? 0.0;
                  StoreProvider.of<StateBangunDatar>(context)
                      .dispatch(CalculateRectangleValue(length, width));
                },
                backgroundColor: Color(0xFF5865f2),
                textColor: Color(0xFFf3f3f3),
              ),
              StoreConnector<StateBangunDatar, double>(
                converter: (store) => store.state.value,
                builder: (context, result) => MyText(
                  text: "Hasil $result",
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
