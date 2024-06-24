import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shuru_frontent/backend/state.dart';

class ApiInterface {
  static const base_url = "http://localhost:5000";
  //Rephrasing
  static const rephrase = "$base_url/rephrase";
  static const rephrase_with_feedback = "$base_url/rephrase_with_feedback";
  //Persona Creation
  static const create_persona_list = "$base_url/create_persona_list";
  //Chat
  static const get_agent_perspective = "$base_url/get_agent_perspective";
  static const generate_solution = "$base_url/generate_solution";
  static const get_agent_feedback = "$base_url/get_agent_feedback";
  static const generate_solution_with_feedback =
      "$base_url/generate_solution_with_feedback";
  static String removeCharsBeforeBracket(String input) =>
      input.contains('[') ? input.substring(input.indexOf('[')) : input;
  // static String extractListFromString(String inputString) {
  //   int startIndex = inputString.indexOf('[');
  //   int endIndex = inputString.lastIndexOf(']') +
  //       1; // +1 to include the ']' in the substring
  //   if (startIndex != -1 && endIndex != -1) {
  //     return inputString.substring(startIndex, endIndex);
  //   } else {
  //     return "[]"; // Return an empty list representation if no list is found
  //   }
  // }
  static List<dynamic> extractListFromString(String inputString) {
    int startIndex = inputString.indexOf('[');
    int endIndex = inputString.lastIndexOf(']') +
        1; // +1 to include the ']' in the substring
    if (startIndex != -1 && endIndex != -1) {
      String listString = inputString.substring(startIndex, endIndex);
      return json.decode(listString); // Decode the list string into a Dart List
    } else {
      return []; // Return an empty list if no list is found
    }
  }

  static Future<void> getRephrasedPrompt(
      {required String problemStatement, required WidgetRef ref}) async {
    print(problemStatement);
    final response = await http.post(
      Uri.parse(rephrase),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({"problem_statement": problemStatement}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final rephrasedPrompt = responseData['response'];
      ref.read(promptProvider.notifier).update((state) => rephrasedPrompt);
    } else {
      print(
          'Failed to send problem statement. Status code: ${response.statusCode}');
    }
  }

  static Future<void> getRephrasedPromptAfterFeedback(
      {required String previous_ver,
      required String feedback,
      required WidgetRef ref}) async {
    final response = await http.post(
      Uri.parse(rephrase_with_feedback),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "previous_ver": previous_ver,
        "feedback": feedback,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final rephrasedPrompt = responseData['response'];
      ref.read(promptProvider.notifier).update((state) => rephrasedPrompt);
    } else {
      print(
          'Failed to send problem statement. Status code: ${response.statusCode}');
    }
  }

  static Future<void> getPersonaList(
      {required String problemStatement, required WidgetRef ref}) async {
    final response = await http.post(
      Uri.parse(create_persona_list),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({"problem_statement": problemStatement}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      List<dynamic> personaList = responseData['response'];
      ref.read(personaListProvider.notifier).update((state) => personaList);
    } else {
      print(
          'Failed to send problem statement. Status code: ${response.statusCode}');
    }
  }
}
