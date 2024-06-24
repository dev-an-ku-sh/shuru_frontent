// import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shuru_frontent/backend/api_interface.dart';

// class Page4 extends ConsumerStatefulWidget {
//   const Page4({super.key});

//   @override
//   ConsumerState<Page4> createState() => _Page4State();
// }

// class _Page4State extends ConsumerState<Page4> {
//   List PersonaList = [
//     ["Miner Max", "Advocate for increasing network capacity..."],
//     ["Developer Dan", "Propose the development and implementation..."],
//   ];
//   String userInput = 'how to reduce evm gas fees';
//   List<Map<String, String>> responses =
//       []; // Updated to store responses with persona names
//   bool isFetchingResponse = false;
//   String pov_para = '';
//   String currentTypingPersona = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchResponsesSequentially();
//   }

//   void fetchResponsesSequentially() async {
//     for (var i = 0; i < PersonaList.length; i++) {
//       setState(() {
//         isFetchingResponse = true;
//         currentTypingPersona = "${PersonaList[i][0]} is typing...";
//       });
//       var response = await ApiInterface.getAgentResponse(
//         agent_name: PersonaList[i][0],
//         agent_perspective: PersonaList[i][1],
//         problemStatement: userInput,
//         ref: ref,
//       );
//       setState(() {
//         responses.add({
//           "persona": PersonaList[i][0],
//           "response": "${PersonaList[i][0]}:\n$response",
//         });
//         pov_para += response + " ";
//         isFetchingResponse = false;
//       });
//     }
//     fetchSolution();
//   }

//   void fetchSolution() async {
//     setState(() {
//       isFetchingResponse = true;
//       currentTypingPersona = "Finding solution...";
//     });
//     var solution = await ApiInterface.getSolution(
//         pov_para: pov_para, problemStatement: userInput, ref: ref);
//     setState(() {
//       responses.add({
//         "persona": "Solution",
//         "response": "Based on the perspectives provided I suggest:\n$solution",
//       });
//       isFetchingResponse = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 500,
//           width: 700,
//           child: ListView.builder(
//             itemCount: responses.length + 1 + (isFetchingResponse ? 1 : 0),
//             itemBuilder: (context, index) {
//               if (index == 0) {
//                 return ChatBubble(
//                   backGroundColor: Colors.grey,
//                   clipper: ChatBubbleClipper7(type: BubbleType.sendBubble),
//                   padding: const EdgeInsets.all(10),
//                   child: Text(userInput),
//                 );
//               } else if (index <= responses.length) {
//                 // Check if it's the final solution or a persona response
//                 String displayText = responses[index - 1]["response"]!;
//                 return ChatBubble(
//                   clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                   child: Text(displayText),
//                 );
//               } else {
//                 return ChatBubble(
//                   clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                   child: Text(currentTypingPersona),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shuru_frontent/backend/api_interface.dart';

// class Page4 extends ConsumerStatefulWidget {
//   const Page4({super.key});

//   @override
//   ConsumerState<Page4> createState() => _Page4State();
// }

// class _Page4State extends ConsumerState<Page4> {
//   List PersonaList = [
//     ["Miner Max", "Advocate for increasing network capacity..."],
//     ["Developer Dan", "Propose the development and implementation..."],
//   ];
//   String userInput = 'how to reduce evm gas fees';
//   List<Map<String, String>> responses = [];
//   bool isFetchingResponse = false;
//   String pov_para = '';
//   String currentTypingPersona = '';
//   String finalSolution = ''; // Variable to store the final solution

//   @override
//   void initState() {
//     super.initState();
//     fetchResponsesSequentially();
//   }

//   void fetchResponsesSequentially() async {
//     for (var i = 0; i < PersonaList.length; i++) {
//       setState(() {
//         isFetchingResponse = true;
//         currentTypingPersona = "${PersonaList[i][0]} is typing...";
//       });
//       var response = await ApiInterface.getAgentResponse(
//         agent_name: PersonaList[i][0],
//         agent_perspective: PersonaList[i][1],
//         problemStatement: userInput,
//         ref: ref,
//       );
//       setState(() {
//         responses.add({
//           "persona": PersonaList[i][0],
//           "response": "${PersonaList[i][0]}:\n$response",
//         });
//         pov_para += response + " ";
//         isFetchingResponse = false;
//       });
//     }
//     fetchSolution();
//   }

//   void fetchSolution() async {
//     setState(() {
//       isFetchingResponse = true;
//       currentTypingPersona = "Finding solution...";
//     });
//     var solution = await ApiInterface.getSolution(
//         pov_para: pov_para, problemStatement: userInput, ref: ref);
//     setState(() {
//       finalSolution = solution; // Store the final solution
//       responses.add({
//         "persona": "Solution",
//         "response": "Based on the perspectives provided I suggest:\n$solution",
//       });
//       isFetchingResponse = false;
//     });
//     fetchAgentFeedback(); // Call fetchAgentFeedback after fetching the solution
//   }

//   void fetchAgentFeedback() async {
//     for (var i = 0; i < PersonaList.length; i++) {
//       setState(() {
//         isFetchingResponse = true;
//         currentTypingPersona =
//             "${PersonaList[i][0]} is reviewing the solution...";
//       });
//       var feedback = await ApiInterface.getAgentFeedback(
//         agent_name: PersonaList[i][0],
//         agent_perspective: PersonaList[i][1],
//         problemStatement: userInput,
//         solution: finalSolution,
//         ref: ref,
//       );
//       setState(() {
//         responses.add({
//           "persona": PersonaList[i][0],
//           "feedback": "${PersonaList[i][0]}:\n$feedback",
//         });
//         isFetchingResponse = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 500,
//           width: 700,
//           child: ListView.builder(
//             itemCount: responses.length + 1 + (isFetchingResponse ? 1 : 0),
//             itemBuilder: (context, index) {
//               if (index == 0) {
//                 return ChatBubble(
//                   backGroundColor: Colors.grey,
//                   clipper: ChatBubbleClipper7(type: BubbleType.sendBubble),
//                   padding: const EdgeInsets.all(10),
//                   child: Text(userInput),
//                 );
//               } else if (index <= responses.length) {
//                 String displayText = responses[index - 1]["response"] ??
//                     responses[index - 1]["feedback"]!;
//                 return ChatBubble(
//                   clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                   child: Text(displayText),
//                 );
//               } else {
//                 return ChatBubble(
//                   clipper: ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                   child: Text(currentTypingPersona),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shuru_frontent/backend/api_interface.dart';

// class Page4 extends ConsumerStatefulWidget {
//   const Page4({super.key});

//   @override
//   ConsumerState<Page4> createState() => _Page4State();
// }

// class _Page4State extends ConsumerState<Page4> {
//   List PersonaList = [
//     ["Miner Max", "Advocate for increasing network capacity..."],
//     ["Developer Dan", "Propose the development and implementation..."],
//   ];
//   String userInput = 'how to reduce evm gas fees';
//   List<Map<String, String>> responses = [];
//   bool isFetchingResponse = false;
//   String pov_para = '';
//   String feedback_para = ''; // Variable to store feedback responses
//   String currentTypingPersona = '';
//   String finalSolution = ''; // Variable to store the final solution
//   final TextEditingController feedbackController =
//       TextEditingController(); // Controller for feedback input

//   @override
//   void initState() {
//     super.initState();
//     fetchResponsesSequentially();
//   }

//   void fetchResponsesSequentially() async {
//     for (var i = 0; i < PersonaList.length; i++) {
//       setState(() {
//         isFetchingResponse = true;
//         currentTypingPersona = "${PersonaList[i][0]} is typing...";
//       });
//       var response = await ApiInterface.getAgentResponse(
//         agent_name: PersonaList[i][0],
//         agent_perspective: PersonaList[i][1],
//         problemStatement: userInput,
//         ref: ref,
//       );
//       setState(() {
//         responses.add({
//           "persona": PersonaList[i][0],
//           "response": "${PersonaList[i][0]}:\n$response",
//         });
//         pov_para += response + " ";
//         isFetchingResponse = false;
//       });
//     }
//     fetchSolution();
//   }

//   void fetchSolution() async {
//     setState(() {
//       isFetchingResponse = true;
//       currentTypingPersona = "Finding solution...";
//     });
//     var solution = await ApiInterface.getSolution(
//         pov_para: pov_para, problemStatement: userInput, ref: ref);
//     setState(() {
//       finalSolution = solution; // Store the final solution
//       responses.add({
//         "persona": "Solution",
//         "response": "Based on the perspectives provided I suggest:\n$solution",
//       });
//       isFetchingResponse = false;
//     });
//     fetchAgentFeedback(); // Call fetchAgentFeedback after fetching the solution
//   }

//   void fetchAgentFeedback() async {
//     for (var i = 0; i < PersonaList.length; i++) {
//       setState(() {
//         isFetchingResponse = true;
//         currentTypingPersona =
//             "${PersonaList[i][0]} is reviewing the solution...";
//       });
//       var feedback = await ApiInterface.getAgentFeedback(
//         agent_name: PersonaList[i][0],
//         agent_perspective: PersonaList[i][1],
//         problemStatement: userInput,
//         solution: finalSolution,
//         ref: ref,
//       );
//       setState(() {
//         responses.add({
//           "persona": PersonaList[i][0],
//           "feedback": "${PersonaList[i][0]}:\n$feedback",
//         });
//         feedback_para += feedback + " "; // Append feedback to feedback_para
//         isFetchingResponse = false;
//       });
//     }
//   }

//   void getSolutionAfterFeedback() async {
//     setState(() {
//       isFetchingResponse = true;
//       currentTypingPersona = "Processing feedback...";
//     });
//     var userFeedbackResponse = await ApiInterface.getSolutionWithFeedback(
//         prev_solution: finalSolution,
//         feedback: feedback_para,
//         problemStatement: userInput,
//         ref: ref);
//     setState(() {
//       finalSolution =
//           userFeedbackResponse; // Set the value of finalSolution to the response
//       responses.add({
//         "persona": "User Feedback",
//         "response": "Based on your feedback:\n$userFeedbackResponse",
//       });
//       isFetchingResponse = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: SizedBox(
//                 width: 700,
//                 child: ListView.builder(
//                   itemCount:
//                       responses.length + 1 + (isFetchingResponse ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index == 0) {
//                       return ChatBubble(
//                         backGroundColor: Colors.grey,
//                         clipper:
//                             ChatBubbleClipper7(type: BubbleType.sendBubble),
//                         padding: const EdgeInsets.all(10),
//                         child: Text(userInput),
//                       );
//                     } else if (index <= responses.length) {
//                       String displayText = responses[index - 1]["response"] ??
//                           responses[index - 1]["feedback"]!;
//                       return ChatBubble(
//                         clipper:
//                             ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                         child: Text(displayText),
//                       );
//                     } else {
//                       return ChatBubble(
//                         clipper:
//                             ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                         child: Text(currentTypingPersona),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("To continue, give feedback in the text field below"),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 controller: feedbackController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Feedback',
//                 ),
//                 onSubmitted: (value) {
//                   feedback_para +=
//                       value + " "; // Append the text entered to feedback_para
//                   getSolutionAfterFeedback(); // Create a new bubble with the feedback
//                   feedbackController
//                       .clear(); // Clear the text field after submission
//                 },
//               ),
//             ),
//             if (isFetchingResponse) CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
  ];
  String userInput = 'how to reduce evm gas fees';
  List<Map<String, String>> responses = [];
  bool isFetchingResponse = false;
  String pov_para = '';
  String feedback_para = ''; // Variable to store feedback responses
  String currentTypingPersona = '';
  String finalSolution = ''; // Variable to store the final solution
  bool showFeedbackInput =
      false; // Variable to control the visibility of the feedback input and text
  final TextEditingController feedbackController =
      TextEditingController(); // Controller for feedback input

  @override
  void initState() {
    super.initState();
    fetchResponsesSequentially();
  }

  void fetchResponsesSequentially() async {
    for (var i = 0; i < PersonaList.length; i++) {
      setState(() {
        isFetchingResponse = true;
        currentTypingPersona = "${PersonaList[i][0]} is typing...";
      });
      var response = await ApiInterface.getAgentResponse(
        agent_name: PersonaList[i][0],
        agent_perspective: PersonaList[i][1],
        problemStatement: userInput,
        ref: ref,
      );
      setState(() {
        responses.add({
          "persona": PersonaList[i][0],
          "response": "${PersonaList[i][0]}:\n$response",
        });
        pov_para += response + " ";
        isFetchingResponse = false;
      });
    }
    fetchSolution();
  }

  void fetchSolution() async {
    setState(() {
      isFetchingResponse = true;
      currentTypingPersona = "Finding solution...";
    });
    var solution = await ApiInterface.getSolution(
        pov_para: pov_para, problemStatement: userInput, ref: ref);
    setState(() {
      finalSolution = solution; // Store the final solution
      responses.add({
        "persona": "Solution",
        "response": "Based on the perspectives provided I suggest:\n$solution",
      });
      isFetchingResponse = false;
    });
    fetchAgentFeedback(); // Call fetchAgentFeedback after fetching the solution
  }

  Future<void> fetchAgentFeedback() async {
    for (var i = 0; i < PersonaList.length; i++) {
      setState(() {
        isFetchingResponse = true;
        currentTypingPersona =
            "${PersonaList[i][0]} is reviewing the solution...";
      });
      var feedback = await ApiInterface.getAgentFeedback(
        agent_name: PersonaList[i][0],
        agent_perspective: PersonaList[i][1],
        problemStatement: userInput,
        solution: finalSolution,
        ref: ref,
      );
      setState(() {
        responses.add({
          "persona": PersonaList[i][0],
          "feedback": "${PersonaList[i][0]}:\n$feedback",
        });
        feedback_para += feedback + " "; // Append feedback to feedback_para
        isFetchingResponse = false;
      });
    }
    getSolutionAfterFeedback(); // Call getSolutionAfterFeedback after fetching all feedbacks
  }

  void getSolutionAfterFeedback() async {
    setState(() {
      isFetchingResponse = true;
      currentTypingPersona = "Processing feedback...";
    });
    var userFeedbackResponse = await ApiInterface.getSolutionWithFeedback(
        prev_solution: finalSolution,
        feedback: feedback_para,
        problemStatement: userInput,
        ref: ref);
    setState(() {
      finalSolution =
          userFeedbackResponse; // Set the value of finalSolution to the response
      responses.add({
        "persona": "User Feedback",
        "response": "Based on your feedback:\n$userFeedbackResponse",
      });
      isFetchingResponse = false;
      showFeedbackInput =
          true; // Show the feedback input and text after loading the bubbles
    });
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: SizedBox(
//                 width: 700,
//                 child: ListView.builder(
//                   itemCount:
//                       responses.length + 1 + (isFetchingResponse ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index == 0) {
//                       return ChatBubble(
//                         backGroundColor: Colors.grey,
//                         clipper:
//                             ChatBubbleClipper7(type: BubbleType.sendBubble),
//                         padding: const EdgeInsets.all(10),
//                         child: Text(userInput),
//                       );
//                     } else if (index <= responses.length) {
//                       String displayText = responses[index - 1]["response"] ??
//                           responses[index - 1]["feedback"]!;
//                       return ChatBubble(
//                         clipper:
//                             ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                         child: Text(displayText),
//                       );
//                     } else {
//                       return ChatBubble(
//                         clipper:
//                             ChatBubbleClipper7(type: BubbleType.receiverBubble),
//                         child: Text(currentTypingPersona),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//             if (showFeedbackInput) ...[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child:
//                     Text("To continue, give feedback in the text field below"),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: TextField(
//                   controller: feedbackController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Feedback',
//                   ),
//                   onSubmitted: (value) {
//                     feedback_para +=
//                         value + " "; // Append the text entered to feedback_para
//                     getSolutionAfterFeedback(); // Create a new bubble with the feedback
//                     feedbackController
//                         .clear(); // Clear the text field after submission
//                   },
//                 ),
//               ),
//             ],
//             if (isFetchingResponse) CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 700,
                child: ListView.builder(
                  itemCount:
                      responses.length + 1 + (isFetchingResponse ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ChatBubble(
                        backGroundColor: Colors.grey,
                        clipper:
                            ChatBubbleClipper7(type: BubbleType.sendBubble),
                        padding: const EdgeInsets.all(10),
                        child: Text(userInput),
                      );
                    } else if (index <= responses.length) {
                      String displayText = responses[index - 1]["response"] ??
                          responses[index - 1]["feedback"]!;
                      return ChatBubble(
                        clipper:
                            ChatBubbleClipper7(type: BubbleType.receiverBubble),
                        child: Text(displayText),
                      );
                    } else {
                      return ChatBubble(
                        clipper:
                            ChatBubbleClipper7(type: BubbleType.receiverBubble),
                        child: Text(currentTypingPersona),
                      );
                    }
                  },
                ),
              ),
            ),
            if (showFeedbackInput) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text("To continue, give feedback in the text field below"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: feedbackController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Feedback',
                  ),
                  onSubmitted: (value) async {
                    setState(() {
                      feedback_para =
                          ''; // Reset feedback_para before appending new feedback
                      feedback_para += "$value "; // Append the new feedback
                      responses.add({
                        "persona": "User",
                        "response": "User Feedback:\n$value",
                      }); // Add a senderBubble with the submitted text
                    });
                    fetchAgentFeedback() // Fetch feedback from agents
                        .then((_) => getSolutionAfterFeedback());
                    feedbackController
                        .clear(); // Clear the text field after submission
                  },
                ),
              ),
            ],
            if (isFetchingResponse) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
