import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class Survey4 extends StatefulWidget {
  const Survey4({super.key});

  @override
  State<Survey4> createState() => _Survey4State();
}

class _Survey4State extends State<Survey4> {
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
          page: 4,
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
                      "Do you avoid any specific foods for personal, religious, or ethical reasons?",
                      style: TextStyle(fontSize: 18, letterSpacing: 2.0),
                    ),
                    Center(
                      child: Text(
                        "(Select all that apply)",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: Colors.grey[700],
                            letterSpacing: 2.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                DynamicButton(
                  onClick: () {
                    setState(() =>
                    s4PorkFoodAvoidPressed = !s4PorkFoodAvoidPressed);
                  },
                  setSize: 250,
                  setText: 'Pork',
                  bgColor: s4PorkFoodAvoidPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                  s4PorkFoodAvoidPressed ? 0x00000000 : accentColor,
                  textColor:
                  s4PorkFoodAvoidPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() =>
                    s4AlcoholFoodAvoidPressed = !s4AlcoholFoodAvoidPressed);
                  },
                  setSize: 250,
                  setText: 'Alcohol',
                  bgColor: s4AlcoholFoodAvoidPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                  s4AlcoholFoodAvoidPressed ? 0x00000000 : accentColor,
                  textColor:
                  s4AlcoholFoodAvoidPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() =>
                    s4RedMeatFoodAvoidPressed = !s4RedMeatFoodAvoidPressed);
                  },
                  setSize: 250,
                  setText: 'Red meat',
                  bgColor: s4RedMeatFoodAvoidPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                  s4RedMeatFoodAvoidPressed ? 0x00000000 : accentColor,
                  textColor:
                  s4RedMeatFoodAvoidPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() =>
                    s4ArtificialSweetenersFoodAvoidPressed = !s4ArtificialSweetenersFoodAvoidPressed);
                  },
                  setSize: 250,
                  setText: 'Artificial sweeteners',
                  bgColor: s4ArtificialSweetenersFoodAvoidPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                  s4ArtificialSweetenersFoodAvoidPressed ? 0x00000000 : accentColor,
                  textColor:
                  s4ArtificialSweetenersFoodAvoidPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() =>
                    s4ProcessedFoodsFoodAvoidPressed = !s4ProcessedFoodsFoodAvoidPressed);
                  },
                  setSize: 250,
                  setText: 'Processed foods',
                  bgColor: s4ProcessedFoodsFoodAvoidPressed ? accentColor : 0xFFFFFFFF,
                  borderColor:
                  s4ProcessedFoodsFoodAvoidPressed ? 0x00000000 : accentColor,
                  textColor:
                  s4ProcessedFoodsFoodAvoidPressed ? 0xFFFFFFFF : 0xFF757575,
                ),
                const SizedBox(height: 10),
                SmartTextField(
                  onChangeFunction: (value) {},
                  width: 250,
                  labelText: "Others",
                  errorText: "",
                  controllerName: othersFoodAvoidController,
                  keyboardType: TextInputType.text,
                  filterTextInput:
                  FilteringTextInputFormatter.allow(namingRegEx),
                  isValidInput: true,
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
                    survey4NextButton();
                    navigateTo(context, const Survey5());
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
