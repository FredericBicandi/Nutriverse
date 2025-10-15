import 'package:google_generative_ai/google_generative_ai.dart';
import '../../includes.dart';

class Gemini {
  void init()
  {
    model = GenerativeModel(
      model: 'gemini-2.5-pro',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
      ),
    );
  }

  Future<int?> getTotalKcalDay() async {
    printDebugMsg(
        "--------------------------------Testing GEMINI API KEY--------------------------------------");
    final buffer = StringBuffer();
    final prompt = '''
    You are a professional dietitian.
    Based on the user's data below, calculate **precisely** the total calories (kcal) the user should aim for today to reach their goals.

    User data:
    Height: ${userInfo['height']}
    Weight: ${userInfo['weight']}
    Age: ${userInfo['age']}
    BMI: ${userInfo['bmi']}
    Gender: ${userInfo['gender'] ? 'Male' : 'Female'}
    Goal: ${userInfo['goal']}
    Additional goals: ${userInfo['additional_goals']}
    Diet plan: ${userInfo['Pescatarian Diet Plan']}
    Meals number: ${userInfo['Four Plus Meals']}
    Macronutrient: ${userInfo['High Carbs']}
    Daily protein intake: ${userInfo['Low']}

    Return **only a single integer number**, rounded to the nearest 10, representing the recommended kcal for today. No extra text, explanation, or units.
    ''';

    late final jsonString;
    try {
      final responseStream =
      model.generateContentStream([Content.text(prompt)]);

      await for (var chunk in responseStream) {
        if (chunk.text != null) {
          buffer.write(chunk.text);
        }
      }

      // The full JSON string is now in the buffer
      jsonString = buffer.toString();
      printDebugMsg('FULL JSON STRING -> $jsonString');
    } catch (e) {
      printDebugMsg('ERROR: $e');
    }
    return toInt(jsonString);
  }

}
