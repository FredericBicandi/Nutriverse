import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class Survey5 extends StatefulWidget {
  const Survey5({super.key});

  @override
  State<Survey5> createState() => _Survey5State();
}

class _Survey5State extends State<Survey5> {
  double animationProgress = 0.0;
  bool selected = true;

  void _dismissKeyboard() => FocusScope.of(context).unfocus();

  void checkSelection() {
    if (!survey5NextButton()) return setState(() => selected = false);
    else  setState(() => selected = true);
    navigateTo(context, const Survey6());
  }

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
          page: 5,
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
                  Text(
                    "How many meals do you eat per day?*",
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.red,
                        fontSize: 24,
                        letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 25),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("1 Meal (Intermittent Fasting)");
                      setState(() => s5OneMealOption = true);
                    },
                    setSize: 250,
                    setText: '1 (Intermittent Fasting)',
                    bgColor: s5OneMealOption ? accentColor : 0xFFFFFFFF,
                    textColor: s5OneMealOption ? 0xFFFFFFFF : 0xFF757575,
                    borderColor: s5OneMealOption ? 0x00000000 : accentColor,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("Two Meals");
                      setState(() => s5TwoMealsOption = true);
                    },
                    setSize: 250,
                    setText: '2',
                    bgColor: s5TwoMealsOption ? accentColor : 0xFFFFFFFF,
                    textColor: s5TwoMealsOption ? 0xFFFFFFFF : 0xFF757575,
                    borderColor: s5TwoMealsOption ? 0x00000000 : accentColor,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("Three Meals");
                      setState(() => s5ThreeMealsOption = true);
                    },
                    setSize: 250,
                    setText: '3',
                    bgColor: s5ThreeMealsOption ? accentColor : 0xFFFFFFFF,
                    textColor: s5ThreeMealsOption ? 0xFFFFFFFF : 0xFF757575,
                    borderColor: s5ThreeMealsOption ? 0x00000000 : accentColor,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("Four Plus Meals");
                      setState(() => s5FourPlusMealsOption = true);
                    },
                    setSize: 250,
                    setText: '4+',
                    bgColor: s5FourPlusMealsOption ? accentColor : 0xFFFFFFFF,
                    textColor: s5FourPlusMealsOption ? 0xFFFFFFFF : 0xFF757575,
                    borderColor: s5FourPlusMealsOption ? 0x00000000 : accentColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 0, 20),
                    child: Text(
                      "We use this information to calculate and provide you with daily personalized recommendations",
                      style: TextStyle(color: Colors.grey[700], fontSize: 10),
                    ),
                  ),
                  DynamicButton(
                    onClick: () => checkSelection(),
                    setText: "Next",
                    setIcon: Icons.navigate_next,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
