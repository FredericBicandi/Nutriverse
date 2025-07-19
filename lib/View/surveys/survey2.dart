import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class Survey2 extends StatefulWidget {
  const Survey2({super.key});

  @override
  State<Survey2> createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> {
  double animationProgress = 0.0;
  bool selected = true;

  void checkSelection() {
    if (!survey2NextButton()) {
      setState(() => selected = false);
      return;
    } else {
      setState(() => selected = true);
    }
    navigateTo(context, const Survey3());
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
        title: SurveyProgressIndicator(
          page: 2,
          progress: animationProgress,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                "Do you follow any specific diet?*",
                style: TextStyle(
                  color: selected ? Colors.black : Colors.red,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 25),
              DynamicButton(
                onClick: () {
                  survey2ChoiceUpdate("Vegan Diet Plan");
                  setState(
                      () => s2VeganDietPlanPressed = !s2VeganDietPlanPressed);
                },
                setSize: 250,
                setText: 'Vegan',
                bgColor: s2VeganDietPlanPressed ? accentColor : 0xFFFFFFFF,
                borderColor: s2VeganDietPlanPressed ? 0x00000000 : accentColor,
                textColor: s2VeganDietPlanPressed ? 0xFFFFFFFF : 0xFF757575,
              ), // Eliminate
              const SizedBox(height: 10),
              DynamicButton(
                onClick: () {
                  survey2ChoiceUpdate("Vegetarian Diet Plan");
                  setState(() => s2VegetarianDietPlanPressed =
                      !s2VegetarianDietPlanPressed);
                },
                setSize: 250,
                setText: 'Vegetarian',
                bgColor: s2VegetarianDietPlanPressed ? accentColor : 0xFFFFFFFF,
                borderColor:
                    s2VegetarianDietPlanPressed ? 0x00000000 : accentColor,
                textColor:
                    s2VegetarianDietPlanPressed ? 0xFFFFFFFF : 0xFF757575,
              ), // Eliminate
              const SizedBox(height: 10),
              DynamicButton(
                onClick: () {
                  survey2ChoiceUpdate("Pescatarian Diet Plan");
                  setState(() => s2PescatarianDietPlanPressed =
                      !s2PescatarianDietPlanPressed);
                },
                setSize: 250,
                setText: 'Pescatarian',
                bgColor:
                    s2PescatarianDietPlanPressed ? accentColor : 0xFFFFFFFF,
                borderColor:
                    s2PescatarianDietPlanPressed ? 0x00000000 : accentColor,
                textColor:
                    s2PescatarianDietPlanPressed ? 0xFFFFFFFF : 0xFF757575,
              ), //
              const SizedBox(height: 10),
              DynamicButton(
                onClick: () {
                  survey2ChoiceUpdate("Keto Diet Plan");
                  setState(
                      () => s2KetoDietPlanPressed = !s2KetoDietPlanPressed);
                },
                setSize: 250,
                setText: 'Keto',
                bgColor: s2KetoDietPlanPressed ? accentColor : 0xFFFFFFFF,
                borderColor: s2KetoDietPlanPressed ? 0x00000000 : accentColor,
                textColor: s2KetoDietPlanPressed ? 0xFFFFFFFF : 0xFF757575,
              ),
              const SizedBox(height: 10),
              DynamicButton(
                onClick: () {
                  survey2ChoiceUpdate("Mediterranean Diet Plan");
                  setState(() => s2MediterraneanDietPlanPressed =
                      !s2MediterraneanDietPlanPressed);
                },
                setSize: 250,
                setText: 'Mediterranean',
                bgColor:
                    s2MediterraneanDietPlanPressed ? accentColor : 0xFFFFFFFF,
                borderColor:
                    s2MediterraneanDietPlanPressed ? 0x00000000 : accentColor,
                textColor:
                    s2MediterraneanDietPlanPressed ? 0xFFFFFFFF : 0xFF757575,
              ),
              const SizedBox(height: 10),
              DynamicButton(
                onClick: () {
                  survey2ChoiceUpdate("No specific Diet Plan");
                  setState(() => s2NoSpecificDietPlanPressed =
                      !s2NoSpecificDietPlanPressed);
                },
                setSize: 250,
                setText: 'No specific diet',
                bgColor: s2NoSpecificDietPlanPressed ? accentColor : 0xFFFFFFFF,
                borderColor:
                    s2NoSpecificDietPlanPressed ? 0x00000000 : accentColor,
                textColor:
                    s2NoSpecificDietPlanPressed ? 0xFFFFFFFF : 0xFF757575,
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
    );
  }
}
