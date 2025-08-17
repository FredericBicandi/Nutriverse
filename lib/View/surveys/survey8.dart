import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class Survey8 extends StatefulWidget {
  const Survey8({super.key});

  @override
  State<Survey8> createState() => _Survey8State();
}

class _Survey8State extends State<Survey8> {
  double animationProgress = 0.0;
  bool selected = true;

  void _dismissKeyboard() => FocusScope.of(context).unfocus();

  void checkSelection() {
    if (!survey8NextButton()) {
      setState(() => selected = false);
      return;
    } else {
      setState(() => selected = true);
    }
    navigateTo(context, const Survey9());
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
          page: 8,
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
                    "How often do you cook at home?*",
                    style: TextStyle(
                      color: selected ? Colors.black : Colors.red,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 25),
                  DynamicButton(
                    onClick: () {
                      survey8ChoiceUpdate("Almost never");
                      setState(() => s8AlmostNeverCookAtHomeOption = true);
                    },
                    setSize: 250,
                    setText: 'Almost never',
                    bgColor: s8AlmostNeverCookAtHomeOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8AlmostNeverCookAtHomeOption
                        ? 0x00000000
                        : accentColor,
                    textColor:
                        s8AlmostNeverCookAtHomeOption ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey8ChoiceUpdate("One Two Times Per Week");
                      setState(() => s8OneTwoPerWeekCookAtHomeOption = true);
                    },
                    setSize: 250,
                    setText: '1-2 times per week',
                    bgColor: s8OneTwoPerWeekCookAtHomeOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8OneTwoPerWeekCookAtHomeOption
                        ? 0x00000000
                        : accentColor,
                    textColor: s8OneTwoPerWeekCookAtHomeOption
                        ? 0xFFFFFFFF
                        : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey8ChoiceUpdate("Three Five Times Per Week");
                      setState(() => s8ThreeFivePerWeekCookAtHomeOption = true);
                    },
                    setSize: 250,
                    setText: '3-5 times per week',
                    bgColor: s8ThreeFivePerWeekCookAtHomeOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8ThreeFivePerWeekCookAtHomeOption
                        ? 0x00000000
                        : accentColor,
                    textColor: s8ThreeFivePerWeekCookAtHomeOption
                        ? 0xFFFFFFFF
                        : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey8ChoiceUpdate("Daily");
                      setState(() => s8DailyCookAtHomeOption = true);
                    },
                    setSize: 250,
                    setText: 'Daily',
                    bgColor: s8DailyCookAtHomeOption ? accentColor : 0xFFFFFFFF,
                    borderColor:
                        s8DailyCookAtHomeOption ? 0x00000000 : accentColor,
                    textColor:
                        s8DailyCookAtHomeOption ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text(
                      "What kitchen appliances do you have?",
                      style: TextStyle(fontSize: 16, letterSpacing: 2.0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "(So AI can suggest easy meal preps based on available tools)",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 25),
                  DynamicButton(
                    onClick: () {
                      setState(() => s8OvenKitchenAppliancesOption =
                          !s8OvenKitchenAppliancesOption);
                    },
                    setSize: 250,
                    setText: 'Oven',
                    bgColor: s8OvenKitchenAppliancesOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8OvenKitchenAppliancesOption
                        ? 0x00000000
                        : accentColor,
                    textColor:
                        s8OvenKitchenAppliancesOption ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      setState(() => s8BlenderKitchenAppliancesOption =
                          !s8BlenderKitchenAppliancesOption);
                    },
                    setSize: 250,
                    setText: 'Blender',
                    bgColor: s8BlenderKitchenAppliancesOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8BlenderKitchenAppliancesOption
                        ? 0x00000000
                        : accentColor,
                    textColor: s8BlenderKitchenAppliancesOption
                        ? 0xFFFFFFFF
                        : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      setState(() => s8AirFryerKitchenAppliancesOption =
                          !s8AirFryerKitchenAppliancesOption);
                    },
                    setSize: 250,
                    setText: 'Air fryer',
                    bgColor: s8AirFryerKitchenAppliancesOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8AirFryerKitchenAppliancesOption
                        ? 0x00000000
                        : accentColor,
                    textColor: s8AirFryerKitchenAppliancesOption
                        ? 0xFFFFFFFF
                        : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      setState(() => s8MicrowaveKitchenAppliancesOption =
                          !s8MicrowaveKitchenAppliancesOption);
                    },
                    setSize: 250,
                    setText: 'Microwave',
                    bgColor: s8MicrowaveKitchenAppliancesOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8MicrowaveKitchenAppliancesOption
                        ? 0x00000000
                        : accentColor,
                    textColor: s8MicrowaveKitchenAppliancesOption
                        ? 0xFFFFFFFF
                        : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      setState(() => s8StoveKitchenAppliancesOption =
                          !s8StoveKitchenAppliancesOption);
                    },
                    setSize: 250,
                    setText: 'Stove',
                    bgColor: s8StoveKitchenAppliancesOption
                        ? accentColor
                        : 0xFFFFFFFF,
                    borderColor: s8StoveKitchenAppliancesOption
                        ? 0x00000000
                        : accentColor,
                    textColor: s8StoveKitchenAppliancesOption
                        ? 0xFFFFFFFF
                        : 0xFF757575,
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
