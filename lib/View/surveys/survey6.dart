import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class Survey6 extends StatefulWidget {
  const Survey6({super.key});

  @override
  State<Survey6> createState() => _Survey6State();
}

class _Survey6State extends State<Survey6> {
  double animationProgress = 0.0;
  bool selected = true;

  void _dismissKeyboard() => FocusScope.of(context).unfocus();

  void checkSelection() {
    if (!survey6NextButton()) {
      setState(() => selected = false);
      return;
    } else {
      setState(() => selected = true);
    }
    navigateTo(context, const Survey7());
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
          page: 6,
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
                    "How often do you eat out or order food?*",
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.red,
                        fontSize: 24,
                        letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 25),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("Rarely");
                      setState(() => s6RarelyEatFastFoodOption = true);
                    },
                    setSize: 250,
                    setText: 'Rarely',
                    bgColor: s6RarelyEatFastFoodOption ? accentColor : 0xFFFFFFFF,
                    borderColor: s6RarelyEatFastFoodOption ? 0x00000000 : accentColor,
                    textColor: s6RarelyEatFastFoodOption ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("One-Two times per week");
                      setState(() => s6OneTwoPerWeekEatFastFoodOption = true);
                    },
                    setSize: 250,
                    setText: '1-2 times per week',
                    bgColor: s6OneTwoPerWeekEatFastFoodOption ? accentColor : 0xFFFFFFFF,
                    borderColor: s6OneTwoPerWeekEatFastFoodOption ? 0x00000000 : accentColor,
                    textColor: s6OneTwoPerWeekEatFastFoodOption ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("Three-Five times per week");
                      setState(() => s6ThreeFivePerWeekEatFastFoodOption = true);
                    },
                    setSize: 250,
                    setText: '3-5 times per week',
                    bgColor: s6ThreeFivePerWeekEatFastFoodOption ? accentColor : 0xFFFFFFFF,
                    borderColor: s6ThreeFivePerWeekEatFastFoodOption ? 0x00000000 : accentColor,
                    textColor: s6ThreeFivePerWeekEatFastFoodOption ? 0xFFFFFFFF : 0xFF757575,
                  ),
                  const SizedBox(height: 10),
                  DynamicButton(
                    onClick: () {
                      survey5ChoiceUpdate("Almost daily");
                      setState(() => s6AlmostDailyEatFastFoodOption = true);
                    },
                    setSize: 250,
                    setText: 'Almost Daily',
                    bgColor: s6AlmostDailyEatFastFoodOption ? accentColor : 0xFFFFFFFF,
                    borderColor: s6AlmostDailyEatFastFoodOption ? 0x00000000 : accentColor,
                    textColor: s6AlmostDailyEatFastFoodOption ? 0xFFFFFFFF : 0xFF757575,
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
