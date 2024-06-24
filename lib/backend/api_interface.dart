import 'package:http/http.dart' as http;
import 'dart:convert';

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

  static Future<void> getRephrasedPrompt(
      {required String problemStatement}) async {
    print(problemStatement);
    final response = await http.post(
      Uri.parse(rephrase),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({"problem_statement": problemStatement}),
    );

    if (response.statusCode == 200) {
      // Assuming the response is JSON. Adjust based on actual response format.
      print('Response from server: ${response.body}');
    } else {
      print(
          'Failed to send problem statement. Status code: ${response.statusCode}');
    }
  }
}
