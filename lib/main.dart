import 'package:flutter/material.dart';
import 'package:shuru_frontent/pages/page1.dart';
import 'package:shuru_frontent/pages/page2.dart';
import 'package:shuru_frontent/pages/page3.dart';
import 'package:shuru_frontent/pages/page4.dart';

void main() {
  runApp(const MyMaterialBase());
}

class MyMaterialBase extends StatefulWidget {
  const MyMaterialBase({super.key});

  @override
  State<MyMaterialBase> createState() => _MyMaterialBaseState();
}

class _MyMaterialBaseState extends State<MyMaterialBase> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}
