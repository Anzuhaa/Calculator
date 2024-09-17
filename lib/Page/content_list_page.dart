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
        GoRouter.of(context).go('/PersegiPage');
      }),
      ModelContent("Bangun Ruang", () {
        GoRouter.of(context).go('/PersegiPanjangPage');
      }),
      ModelContent("Aritmatika", () {
        GoRouter.of(context).go('/AritmatikPage');
      }),
      ModelContent("Perpangkatan", () {}),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "List Calculator",
          fontsize: 16,
          fontfamily: 'MontserratBold',
          color: Color(0xfff3f3f3),
        ),
      ),
      body: ListView.builder(
        itemCount: contentData.length,
        itemBuilder: (context, index) {
          return AdapterList(modelContent: contentData[index]);
        },
      ),
    );
  }
}
