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
    [
      "Miner Max",
      "Advocate for increasing network capacity by encouraging more miners to join the network, believing that competition among miners will drive down gas fees."
    ],
    [
      "Developer Dan",
      "Propose the development and implementation of layer 2 scaling solutions like Optimistic Rollups and zk-Rollups to reduce the load on the base layer and lower gas fees for users."
    ],
    [
      "User Umar",
      "Advocate for optimizing smart contract usage by batching transactions, minimizing the number of interactions with contracts, and using gas price estimators to make informed decisions about when to send transactions."
    ],
    [
      "Investor Isabella",
      "Invest in projects that are building decentralized infrastructure to reduce reliance on the EVM, such as alternative blockchains or sidechains, as a long-term solution for lowering gas fees."
    ],
    [
      "Regulator Ravi",
      "Advocate for and implement regulations and guidelines that incentivize more ethical usage of the network, reducing the need for excessive contract calls and thus lowering overall gas usage and fees."
    ]
  ];
  String userInput = 'how to reduce evm gas fees';
  List<String> responses = []; // To store responses
  bool isFetchingResponse = false; // Flag to indicate fetching state

  @override
  void initState() {
    super.initState();
    fetchResponsesSequentially();
  }

  void fetchResponsesSequentially() async {
    for (var i = 0; i < PersonaList.length; i++) {
      setState(() {
        isFetchingResponse = true; // Start fetching response
      });
      var response = await ApiInterface.getAgentResponse(
        agent_name: PersonaList[i][0],
        agent_perspective: PersonaList[i][1],
        problemStatement: userInput,
        ref: ref, // Assuming 'ref' is available in your context
      );
      setState(() {
        responses.add(response);
        isFetchingResponse = false; // Response fetched
      });
    }
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
                // User input bubble
                return ChatBubble(
                  backGroundColor: Colors.grey,
                  clipper: ChatBubbleClipper7(type: BubbleType.sendBubble),
                  padding: const EdgeInsets.all(10),
                  child: Text(userInput),
                );
              } else if (index <= responses.length) {
                // Response bubbles
                return ChatBubble(
                  clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
                  child: Text(responses[index - 1]),
                );
              } else {
                // Typing indicator
                return ChatBubble(
                  clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
                  child:
                      Text("${PersonaList[responses.length][0]} is typing..."),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
