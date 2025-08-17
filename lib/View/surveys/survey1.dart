import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class Survey1 extends StatefulWidget {
  const Survey1({super.key});

  @override
  State<Survey1> createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  double animationProgress = 0.0;

  @override
  void initState() {
    super.initState();
    startProgress(
      animationProgress,
      (double value) => setState(() => animationProgress = value),
    );

    surveyAnswers['AdditionalGoals'] = '';
    surveyAnswers['DietPlan'] = '';
    surveyAnswers['Allergies'] = '';
    surveyAnswers['Avoid'] = '';
    surveyAnswers['MealsNumber'] = '';
    surveyAnswers['FastFood'] = '';
    surveyAnswers['Macronutrient'] = '';
    surveyAnswers['DailyProteinConsume'] = '';
    surveyAnswers['HomeMealOften'] = '';
    surveyAnswers['KitchenAppliances'] = '';
    surveyAnswers['MedicalConditions'] = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SurveyProgressIndicator(
          page: 1,
          progress: animationProgress,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "What Additional goals do you have?",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 25),
                DynamicButton(
                  onClick: () => setState(() => s1LivingLongerButtonPressed = !s1LivingLongerButtonPressed),
                  setSize: 250,
                  setText: 'Living longer',
                  bgColor: s1LivingLongerButtonPressed ? accentColor : 0xFFFFFFFF,
                  textColor: s1LivingLongerButtonPressed ? 0xFFFFFFFF : 0xFF757575,
                  borderColor: s1LivingLongerButtonPressed ? 0x00000000 : accentColor,
                ), // living longer
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () => setState(() => s1FeelingEnergizedButtonPressed = !s1FeelingEnergizedButtonPressed),
                  setSize: 250,
                  setText: 'Feeling energized',
                  bgColor: s1FeelingEnergizedButtonPressed ? accentColor : 0xFFFFFFFF,
                  textColor: s1FeelingEnergizedButtonPressed ? 0xFFFFFFFF : 0xFF757575,
                  borderColor: s1FeelingEnergizedButtonPressed ? 0x00000000 : accentColor,
                ), // Feeling energized
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () => setState(() => s1BuildHealthierHabitsButtonPressed = !s1BuildHealthierHabitsButtonPressed),
                  setSize: 250,
                  setText: 'Build healthier habits',
                  bgColor: s1BuildHealthierHabitsButtonPressed ? accentColor : 0xFFFFFFFF,
                  textColor: s1BuildHealthierHabitsButtonPressed ? 0xFFFFFFFF : 0xFF757575,
                  borderColor: s1BuildHealthierHabitsButtonPressed ? 0x00000000 : accentColor,
                ), // build healthier habits
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () => setState(() => s1PreventLifestyleDiseasesButtonPressed = !s1PreventLifestyleDiseasesButtonPressed),
                  setSize: 250,
                  setText: 'Prevent lifestyle diseases',
                  bgColor: s1PreventLifestyleDiseasesButtonPressed ? accentColor : 0xFFFFFFFF,
                  textColor: s1PreventLifestyleDiseasesButtonPressed ? 0xFFFFFFFF : 0xFF757575,
                  borderColor: s1PreventLifestyleDiseasesButtonPressed ? 0x00000000 : accentColor,
                ), // Prevent LifeStyle
                const SizedBox(height: 10), //Optimize
                DynamicButton(
                  onClick: () => setState(() => s1OptimizeAthleticPerformanceButtonPressed = !s1OptimizeAthleticPerformanceButtonPressed),
                  setSize: 250,
                  setText: 'Optimize athletic performance',
                  bgColor: s1OptimizeAthleticPerformanceButtonPressed ? accentColor : 0xFFFFFFFF,
                  textColor: s1OptimizeAthleticPerformanceButtonPressed ? 0xFFFFFFFF : 0xFF757575,
                  borderColor: s1OptimizeAthleticPerformanceButtonPressed ? 0x00000000 : accentColor,
                ), // Optimize
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () => setState(() => s1EliminateAllOrNothingMindsetButtonPressed = !s1EliminateAllOrNothingMindsetButtonPressed),
                  setSize: 250,
                  setText: 'Eliminate All-or-Nothing mindset',
                  bgColor: s1EliminateAllOrNothingMindsetButtonPressed ? accentColor : 0xFFFFFFFF,
                  textColor: s1EliminateAllOrNothingMindsetButtonPressed ? 0xFFFFFFFF : 0xFF757575,
                  borderColor: s1EliminateAllOrNothingMindsetButtonPressed ? 0x00000000 : accentColor,
                ), // Eliminate
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 0, 20),
                  child: Text(
                    "We use this information to calculate and provide you with daily personalized recommendations",
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                  ),
                ),
                DynamicButton(
                  onClick: () {
                    survey1NextButton();
                    navigateTo(context, const Survey2());
                  },
                  setText: "Next",
                  setIcon: Icons.navigate_next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
