import 'package:flutter/material.dart';
import 'package:shuru_frontent/backend/api_interface.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100.0),
        child: TextField(
          controller: textEditingController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Tell us what is on your mind',
          ),
          onSubmitted: (value) {
            setState(() {
              ApiInterface.getRephrasedPrompt(
                  problemStatement: textEditingController.text);
            });
          },
        ),
      )),
    );
  }
}
