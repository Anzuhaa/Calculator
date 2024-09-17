// ignore_for_file: prefer_const_constructors

import 'package:calculator_redux/Component/adapter_list.dart';
import 'package:calculator_redux/Models/model_content.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BangunRuangListPage extends StatefulWidget {
  const BangunRuangListPage({super.key});

  @override
  State<BangunRuangListPage> createState() => _BangunRuangListPageState();
}

class _BangunRuangListPageState extends State<BangunRuangListPage> {
  List<ModelContent> BangunDatarData = [];

  @override
  void initState() {
    super.initState();
    BangunDatarData = [
      ModelContent("Kubus", () {
        GoRouter.of(context).push('/PersegiPage');
      }),
      ModelContent("Balok Page", () {
        GoRouter.of(context).push('/PersegiPanjangPage');
      }),
      ModelContent("Tabung Page", () {
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
            text: "List Bangun Ruang",
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
