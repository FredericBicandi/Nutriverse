import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class Survey3 extends StatefulWidget {
  const Survey3({super.key});

  @override
  State<Survey3> createState() => _Survey3State();
}

class _Survey3State extends State<Survey3> {
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
        title: SurveyProgressIndicator(
          page: 3,
          progress: animationProgress,
        ),
      ),
      body: GestureDetector(
        onTap: _dismissKeyboard,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Wrap(
                  children: [
                    const Text(
                      "Do you have any food allergies or intolerances?",
                      style: TextStyle(fontSize: 24, letterSpacing: 2.0),
                    ),
                    Center(
                      child: Text(
                        "(Select all that apply)",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                DynamicButton(
                  onClick: () {
                    setState(() => s3glutenFoodAllergiesPressed =
                        !s3glutenFoodAllergiesPressed);
                  },
                  setSize: 250,
                  setText: 'Gluten',
                  bgColor: s2VeganDietPlanPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                      s2VeganDietPlanPressed ? 0x00000000 : accentColor,
                  textColor: s2VeganDietPlanPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() => s3nutsFoodAllergiesPressed =
                        !s3nutsFoodAllergiesPressed);
                  },
                  setSize: 250,
                  setText: 'Nuts',
                  bgColor:
                      s3nutsFoodAllergiesPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                      s3nutsFoodAllergiesPressed ? 0x00000000 : accentColor,
                  textColor:
                      s3nutsFoodAllergiesPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() => s3eggsFoodAllergiesPressed =
                        !s3eggsFoodAllergiesPressed);
                  },
                  setSize: 250,
                  setText: 'Eggs',
                  bgColor:
                      s3eggsFoodAllergiesPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                      s3eggsFoodAllergiesPressed ? 0x00000000 : accentColor,
                  textColor:
                      s3eggsFoodAllergiesPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() => s3shellfishFoodAllergiesPressed =
                        !s3shellfishFoodAllergiesPressed);
                  },
                  setSize: 250,
                  setText: 'Shellfish',
                  bgColor: s3shellfishFoodAllergiesPressed
                      ? accentColor
                      : 0xFFFFFFFF,
                  borderColor: s3shellfishFoodAllergiesPressed
                      ? 0x00000000
                      : accentColor,
                  textColor:
                      s3shellfishFoodAllergiesPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() =>
                        s3soyFoodAllergiesPressed = !s3soyFoodAllergiesPressed);
                  },
                  setSize: 250,
                  setText: 'Soy',
                  bgColor: s3soyFoodAllergiesPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                      s3soyFoodAllergiesPressed ? 0x00000000 : accentColor,
                  textColor:
                      s3soyFoodAllergiesPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                SmartTextField(
                  onChangeFunction: (value) {},
                  width: 250,
                  errorText: "",
                  labelText: "Others",
                  isValidInput: true,
                  keyboardType: TextInputType.text,
                  controllerName: othersFoodAllergiesController,
                  filterTextInput:
                      FilteringTextInputFormatter.allow(namingRegEx),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 0, 20),
                  child: Text(
                    "We use this information to calculate and provide you with daily personalized recommendations",
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                  ),
                ),
                DynamicButton(
                  onClick: () {
                    survey3NextButton();
                    navigateTo(context, const Survey4());
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
