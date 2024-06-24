import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shuru_frontent/backend/api_interface.dart';
import 'package:shuru_frontent/backend/state.dart';
import 'package:shuru_frontent/pages/page3.dart';

class Page2 extends ConsumerStatefulWidget {
  const Page2({super.key});

  @override
  ConsumerState<Page2> createState() => _Page2State();
}

class _Page2State extends ConsumerState<Page2> {
  String prompt = '';
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    prompt = ref.read(promptProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    prompt = ref.watch(promptProvider) ?? '';
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Is this what you meant?'),
            Text(prompt),
            const Text('You can provide suggest improvements below'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Suggest improvements',
                ),
                onSubmitted: (val) {
                  ApiInterface.getRephrasedPromptAfterFeedback(
                      previous_ver: prompt,
                      feedback: textEditingController.text,
                      ref: ref);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiInterface.getPersonaList(problemStatement: prompt, ref: ref);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Page3()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
