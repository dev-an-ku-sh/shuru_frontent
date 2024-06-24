import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shuru_frontent/backend/state.dart';
import 'package:shuru_frontent/pages/page1.dart';
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/03.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: PersonaList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Summoning Beings Of Higher Intelligence...',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ) // Show loading indicator when list is empty
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'These AI Agents Will Be Joining You...',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(PersonaList.length, (index) {
                        if (PersonaList.length > index &&
                            PersonaList[index].length >= 2) {
                          return Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            color: Colors.white12,
                            child: Container(
                              height: 300,
                              width: 240,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(PersonaList[index][0],
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  const SizedBox(
                                      height: 10), // Spacing between texts
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
                    const SizedBox(
                      height: 240,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors
                                  .white, // Set the container color to white
                              shape: BoxShape
                                  .circle, // Make the container circular
                            ),
                            child: IconButton(
                              onPressed: () {
                                ref
                                    .read(promptProvider.notifier)
                                    .update((state) => '');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Page1()),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 50,
                              ),
                            ),
                          ),
                          Text(
                            '< Click To Start Over',
                            style: GoogleFonts.ubuntuMono(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 200,
                          ),
                          Text(
                            'Click To Continue To Conference >',
                            style: GoogleFonts.ubuntuMono(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors
                                  .white, // Set the container color to white
                              shape: BoxShape
                                  .circle, // Make the container circular
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Page4()),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
