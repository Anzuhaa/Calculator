// ignore_for_file: prefer_const_constructors

import 'package:calculator_redux/Component/adapter_list.dart';
import 'package:calculator_redux/Models/model_content.dart';
import 'package:calculator_redux/Page/bangun_datar/persegi.dart';
import 'package:calculator_redux/Redux/actions.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BangunDatarListPage extends StatefulWidget {
  const BangunDatarListPage({super.key});

  @override
  State<BangunDatarListPage> createState() => _BangunDatarListPageState();
}

class _BangunDatarListPageState extends State<BangunDatarListPage> {
  List<ModelContent> BangunDatarData = [];

  @override
  void initState() {
    super.initState();
    BangunDatarData = [
      ModelContent("Persegi Page", () {
        GoRouter.of(context).push('/PersegiPage');
      }),
      ModelContent("Persegi Panjang Page", () {
        GoRouter.of(context).push('/PersegiPanjangPage');
      }),
      ModelContent("Segitiga Page", () {
        GoRouter.of(context).push('/SegitigaPage');
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1d22),
      appBar: AppBar(
        backgroundColor: Color(0xff1c1d22),
        title: Center(
          child: MyText(
            text: "List Bangun Datar",
            fontsize: 24,
            fontfamily: 'MontserratBold',
            color: Color(0xfff3f3f3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: BangunDatarData.length,
          itemBuilder: (context, index) {
            return AdapterList(modelContent: BangunDatarData[index]);
          },
        ),
      ),
    );
  }
}
