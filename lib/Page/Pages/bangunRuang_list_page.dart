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
  List<ModelContent> BangunRuangData = [];

  @override
  void initState() {
    super.initState();
    BangunRuangData = [
      ModelContent("Kubus", () {
        GoRouter.of(context).push('/KubusPage');
      }),
      ModelContent("Balok", () {
        GoRouter.of(context).push('/BalokPage');
      }),
      ModelContent("Tabung", () {
        GoRouter.of(context).push('/TabungPage');
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1d22),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFF3F3F3),
        ),
        title: MyText(
          text: 'List Bangun Ruang',
          fontsize: 24,
          fontfamily: 'MontserratBold',
          color: Color(0xFFF3F3F3),
        ),
        backgroundColor: Color(0xff1c1d22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: BangunRuangData.length,
          itemBuilder: (context, index) {
            return AdapterList(modelContent: BangunRuangData[index]);
          },
        ),
      ),
    );
  }
}
