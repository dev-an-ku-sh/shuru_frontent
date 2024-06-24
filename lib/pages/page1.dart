import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuru_frontent/backend/api_interface.dart';
import 'package:shuru_frontent/pages/page2.dart';

class Page1 extends ConsumerStatefulWidget {
  const Page1({super.key});

  @override
  ConsumerState<Page1> createState() => _Page1State();
}

class _Page1State extends ConsumerState<Page1> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/01.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "THE ROUND TABLE",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                TextField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    fillColor: Colors.white24,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Tell us what is on your mind',
                  ),
                  onSubmitted: (value) {
                    ApiInterface.getRephrasedPrompt(
                        problemStatement: textEditingController.text, ref: ref);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page2()),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ideate with the help of our Intelligent AI Agents.",
                      style: GoogleFonts.ubuntuMono(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
