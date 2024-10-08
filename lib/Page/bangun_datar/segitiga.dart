// ignore_for_file: prefer_const_constructors

import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/Redux/store.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:calculator_redux/widgets/my_textbutton.dart';
import 'package:calculator_redux/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../Redux/state.dart';

class MySegitigaPage extends StatefulWidget {
  const MySegitigaPage({super.key});

  @override
  State<MySegitigaPage> createState() => _MySegitigaPageState();
}

class _MySegitigaPageState extends State<MySegitigaPage> {
  final TextEditingController _Value1 = TextEditingController();
  final TextEditingController _Value2 = TextEditingController();
  final TextEditingController _Value3 = TextEditingController();
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
            text: 'Segitiga',
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
              MyTextfield(text: "", label: "Sisi 1", controller: _Value1),
              MyTextfield(text: "", label: "Sisi 2", controller: _Value2),
              MyTextfield(text: "", label: "Sisi 3", controller: _Value3),
              MyTextbutton(
                text: "Hitung Keliling",
                onPressed: () {
                  final sisi1 = double.tryParse(_Value1.text) ?? 0.0;
                  final sisi2 = double.tryParse(_Value2.text) ?? 0.0;
                  final sisi3 = double.tryParse(_Value3.text) ?? 0.0;
                  StoreProvider.of<StateBangunDatar>(context)
                      .dispatch(CalculateTriangleValue(sisi1, sisi2, sisi3));
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
