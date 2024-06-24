import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shuru_frontent/backend/state.dart';
import 'package:shuru_frontent/pages/page4.dart';

class Page3 extends ConsumerStatefulWidget {
  const Page3({super.key});

  @override
  ConsumerState<Page3> createState() => _Page3State();
}

class _Page3State extends ConsumerState<Page3> {
  List PersonaList = [];
  @override
  void initState() {
    PersonaList = ref.read(personaListProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PersonaList = ref.watch(personaListProvider);
    return Scaffold(
      body: Center(
        child: PersonaList.isEmpty
            ? const CircularProgressIndicator() // Show loading indicator when list is empty
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(PersonaList.length, (index) {
                  if (PersonaList.length > index &&
                      PersonaList[index].length >= 2) {
                    return Card(
                      color: Colors.blueGrey,
                      child: Container(
                        height: 300,
                        width: 240,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(PersonaList[index][0],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            const SizedBox(height: 10), // Spacing between texts
                            Text(PersonaList[index][1],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ),
                    );
                  } else {
                    // Return an empty container if the condition is not met
                    return Container();
                  }
                }),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Page4()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
