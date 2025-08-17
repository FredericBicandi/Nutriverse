import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class _Survey7State extends State<Survey7> {
  double animationProgress = 0.0;

  void _dismissKeyboard() => FocusScope.of(context).unfocus();

  @override
  void initState() {
    super.initState();
    startProgress(
      animationProgress,
      (double value) => setState(() => animationProgress = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SurveyProgressIndicator(
          page: 7,
          progress: animationProgress,
        ),
      ),
      body: GestureDetector(
        onTap: _dismissKeyboard,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Do you have a preferred macronutrient balance?",
                    style: TextStyle(fontSize: 24, letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "(For AI to adjust food suggestions)",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[700],
                        fontSize: 12,
                        letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 25),
                  DynamicButton(
                    onClick: () {
                      s7HighCarbsMacronutrient = false;
                      s7BalancedDietMacronutrient = false;
                      s7LowFatMacronutrient = false;
                      setState(() => s7HighProteinMacronutrient =
                          !s7HighProteinMacronutrient);
                      s7HighProteinMacronutrient
                          ? survey7ChoiceUpdate("High Protein")
                          : survey7ChoiceUpdate("");
                    },
                    setSize: 250,
                    setText: 'Rarely',
                    bgColor:
                        s7HighProteinMacronutrient ? accentColor : 0xFFFFFFFF,
                    borderColor:
                        s7HighProteinMacronutrient ? 0x00000000 : accentColor,
                    textColor:
                        s7HighProteinMacronutrient ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      s7HighProteinMacronutrient = false;
                      s7BalancedDietMacronutrient = false;
                      s7LowFatMacronutrient = false;
                      setState(() =>
                          s7HighCarbsMacronutrient = !s7HighCarbsMacronutrient);
                      s7HighCarbsMacronutrient
                          ? survey7ChoiceUpdate("High Carbs")
                          : survey7ChoiceUpdate("");
                    },
                    setSize: 250,
                    setText: 'High Carbs',
                    bgColor:
                        s7HighCarbsMacronutrient ? accentColor : 0xFFFFFFFF,
                    borderColor:
                        s7HighCarbsMacronutrient ? 0x00000000 : accentColor,
                    textColor:
                        s7HighCarbsMacronutrient ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      s7HighProteinMacronutrient = false;
                      s7HighCarbsMacronutrient = false;
                      s7LowFatMacronutrient = false;
                      setState(() => s7BalancedDietMacronutrient =
                          !s7BalancedDietMacronutrient);
                      s7BalancedDietMacronutrient
                          ? survey7ChoiceUpdate("Balanced Diet")
                          : survey7ChoiceUpdate("");
                    },
                    setSize: 250,
                    setText: 'Balanced Diet',
                    bgColor:
                        s7BalancedDietMacronutrient ? accentColor : 0xFFFFFFFF,
                    borderColor:
                        s7BalancedDietMacronutrient ? 0x00000000 : accentColor,
                    textColor:
                        s7BalancedDietMacronutrient ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      s7HighProteinMacronutrient = false;
                      s7HighCarbsMacronutrient = false;
                      s7BalancedDietMacronutrient = false;
                      setState(
                          () => s7LowFatMacronutrient = !s7LowFatMacronutrient);
                      s7LowFatMacronutrient
                          ? survey7ChoiceUpdate("Low Fat")
                          : survey7ChoiceUpdate("");
                    },
                    setSize: 250,
                    setText: 'Low Fat',
                    bgColor: s7LowFatMacronutrient ? accentColor : 0xFFFFFFFF,
                    borderColor:
                        s7LowFatMacronutrient ? 0x00000000 : accentColor,
                    textColor: s7LowFatMacronutrient ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      "How much protein do you consume daily?",
                      style: TextStyle(fontSize: 16, letterSpacing: 2.0),
                    ),
                  ),
                  Text(
                    "(Rough estimate)",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[700],
                        fontSize: 12,
                        letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 25),
                  DynamicButton(
                    onClick: () {
                      s7ModerateProteinConsume = false;
                      s7HighProteinConsume = false;
                      setState(
                          () => s7LowProteinConsume = !s7LowProteinConsume);
                      s7LowProteinConsume
                          ? survey7Choice2Update("Low")
                          : survey7Choice2Update("");
                    },
                    setSize: 250,
                    setText: 'Low (<50g)',
                    bgColor: s7LowProteinConsume ? accentColor : 0xFFFFFFFF,
                    borderColor: s7LowProteinConsume ? 0x00000000 : accentColor,
                    textColor: s7LowProteinConsume ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      s7LowProteinConsume = false;
                      s7HighProteinConsume = false;
                      setState(() =>
                          s7ModerateProteinConsume = !s7ModerateProteinConsume);
                      s7ModerateProteinConsume
                          ? survey7Choice2Update("Moderate")
                          : survey7Choice2Update("");
                    },
                    setSize: 250,
                    setText: 'Moderate (50-100g)',
                    bgColor:
                        s7ModerateProteinConsume ? accentColor : 0xFFFFFFFF,
                    borderColor:
                        s7ModerateProteinConsume ? 0x00000000 : accentColor,
                    textColor:
                        s7ModerateProteinConsume ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      s7LowProteinConsume = false;
                      s7ModerateProteinConsume = false;
                      setState(
                          () => s7HighProteinConsume = !s7HighProteinConsume);
                      s7HighProteinConsume
                          ? survey7Choice2Update("High")
                          : survey7Choice2Update("");
                    },
                    setSize: 250,
                    setText: 'High (100g+)',
                    bgColor: s7HighProteinConsume ? accentColor : 0xFFFFFFFF,
                    borderColor:
                        s7HighProteinConsume ? 0x00000000 : accentColor,
                    textColor: s7HighProteinConsume ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 0, 20),
                    child: Text(
                      "We use this information to calculate and provide you with daily personalized recommendations",
                      style: TextStyle(color: Colors.grey[700], fontSize: 10),
                    ),
                  ),
                  DynamicButton(
                    onClick: () => navigateTo(context, const Survey8()),
                    setText: "Next ",
                    setIcon: Icons.navigate_next,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Survey7 extends StatefulWidget {
  const Survey7({super.key});

  @override
  State<Survey7> createState() => _Survey7State();
}
