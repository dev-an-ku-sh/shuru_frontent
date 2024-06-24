import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shuru_frontent/backend/api_interface.dart';

class Page4 extends ConsumerStatefulWidget {
  const Page4({super.key});

  @override
  ConsumerState<Page4> createState() => _Page4State();
}

class _Page4State extends ConsumerState<Page4> {
  List PersonaList = [
    ["Miner Max", "Advocate for increasing network capacity..."],
    ["Developer Dan", "Propose the development and implementation..."],
    // Other personas...
  ];
  String userInput = 'how to reduce evm gas fees';
  List<String> responses = []; // To store responses
  bool isFetchingResponse = false; // Flag to indicate fetching state
  String pov_para = ''; // String to append all responses
  String currentTypingPersona =
      ''; // To keep track of which persona is "typing"

  @override
  void initState() {
    super.initState();
    fetchResponsesSequentially();
  }

  void fetchResponsesSequentially() async {
    for (var i = 0; i < PersonaList.length; i++) {
      setState(() {
        isFetchingResponse = true; // Start fetching response
        currentTypingPersona =
            "${PersonaList[i][0]} is typing..."; // Set the current typing persona
      });
      var response = await ApiInterface.getAgentResponse(
        agent_name: PersonaList[i][0],
        agent_perspective: PersonaList[i][1],
        problemStatement: userInput,
        ref: ref,
      );
      setState(() {
        responses.add(response);
        pov_para += response + " "; // Append response to pov_para
        isFetchingResponse = false; // Response fetched
      });
    }
    fetchSolution(); // Fetch the solution after all responses are fetched
  }

  void fetchSolution() async {
    setState(() {
      isFetchingResponse = true; // Start fetching final solution
      currentTypingPersona =
          "Finding solution..."; // Set message for finding solution
    });
    var solution = await ApiInterface.getSolution(
        pov_para: pov_para, problemStatement: userInput, ref: ref);
    setState(() {
      responses.add(solution); // Add the final solution to responses
      isFetchingResponse = false; // Final solution fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 700,
          child: ListView.builder(
            itemCount: responses.length + 1 + (isFetchingResponse ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == 0) {
                return ChatBubble(
                  backGroundColor: Colors.grey,
                  clipper: ChatBubbleClipper7(type: BubbleType.sendBubble),
                  padding: const EdgeInsets.all(10),
                  child: Text(userInput),
                );
              } else if (index <= responses.length) {
                return ChatBubble(
                  clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
                  child: Text(responses[index - 1]),
                );
              } else {
                // Display either the current typing persona or the finding solution message
                return ChatBubble(
                  clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
                  child: Text(currentTypingPersona),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
