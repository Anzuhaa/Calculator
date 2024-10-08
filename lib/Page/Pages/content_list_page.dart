// ignore_for_file: prefer_const_constructors

import 'package:calculator_redux/Component/adapter_list.dart';
import 'package:calculator_redux/Models/model_content.dart';
import 'package:calculator_redux/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentListPage extends StatefulWidget {
  const ContentListPage({super.key});

  @override
  State<ContentListPage> createState() => _ContentListPageState();
}

class _ContentListPageState extends State<ContentListPage> {
  List<ModelContent> contentData = [];

  @override
  void initState() {
    super.initState();
    contentData = [
      ModelContent("Bangun Datar", () {
        GoRouter.of(context).push('/BangunDatarPage');
      }),
      ModelContent("Bangun Ruang", () {
        GoRouter.of(context).push('/BangunRuangPage');
      }),
      ModelContent("Perpangkatan", () {
        GoRouter.of(context).push('/PerpangkatanPage');
      }),
      ModelContent("Aritmatika", () {
        GoRouter.of(context).push('/AritmatikPage');
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
            text: "List Calculator",
            fontsize: 24,
            fontfamily: 'MontserratBold',
            color: Color(0xfff3f3f3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: contentData.length,
          itemBuilder: (context, index) {
            return AdapterList(modelContent: contentData[index]);
          },
        ),
      ),
    );
  }
}
