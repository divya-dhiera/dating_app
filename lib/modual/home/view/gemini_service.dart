import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final model = GenerativeModel(
    model: 'gemini-2.5-pro',
    apiKey: "AIzaSyCui7tU81MDWDZFqrCgt_AfN7dXVJ871BQ",
  );

  Future<String> askGemini(String prompt) async {
    final response = await model.generateContent([Content.text(prompt)]);
    return response.text ?? "No response";
  }
}
