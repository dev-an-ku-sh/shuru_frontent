import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Is this what you meant?'),
            Text('This is texttt'),
            Text('You can provide suggest improvements below'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Suggest improvements',
                ),
                onSubmitted: (String) {
                  print('String');
                },
              ),
            )
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
