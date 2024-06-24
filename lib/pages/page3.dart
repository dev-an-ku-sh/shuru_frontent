import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 300,
              width: 240,
              color: Colors.red,
            ),
            Container(
              height: 300,
              width: 240,
              color: Colors.red,
            ),
            Container(
              height: 300,
              width: 240,
              color: Colors.red,
            ),
            Container(
              height: 300,
              width: 240,
              color: Colors.red,
            ),
            Container(
              height: 300,
              width: 240,
              color: Colors.red,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pop(context);
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
