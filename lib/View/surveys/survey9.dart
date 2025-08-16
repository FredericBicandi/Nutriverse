import '../../Controller/surveys/surveys.dart';
import 'package:flutter/material.dart';
import '../../includes.dart';

class _Survey9State extends State<Survey9> {
  double animationProgress = 0.0;

  void checkSelection() async {
    setState(() => isLoading = true);
    int? response = await survey9NextButton();
    if (response == 200) {
      newStackScreen(context, const AuthScreen());
    } else if (response == 500) {
      // ignore: use_build_context_synchronously
      await iosAlert(
        context,
        "Unknown Error!",
        "Check Your Internet Connection And Try Again",
      );
      setState(() => isLoading = false);
      return;
    } else {
      // ignore: use_build_context_synchronously
      await iosAlert(
        context,
        "Data cannot be saved",
        "an error occurred while trying to save your preferences please restart the app and try again",
      );
    }
  }

  @override
  void initState() {
    isLoading = false;
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
          page: 9,
          progress: animationProgress,
        ),
      ),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Wrap(
                  children: [
                    const Text(
                      "Do you have any medical conditions that affect your diet?",
                      style: TextStyle(fontSize: 24, letterSpacing: 2.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text(
                        "(Optional, but can help AI customize meals)",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 2.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                DynamicButton(
                  onClick: () {
                    setState(() => s9DiabetesMedicalConditionOption =
                        !s9DiabetesMedicalConditionOption);
                  },
                  setSize: 250,
                  setText: 'Diabetes',
                  bgColor: s9DiabetesMedicalConditionOption
                      ? accentColor
                      : 0xFFFFFFFF,
                  borderColor: s9DiabetesMedicalConditionOption
                      ? 0x00000000
                      : accentColor,
                  textColor: s9DiabetesMedicalConditionOption
                      ? 0xFFFFFFFF
                      : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() => s9DiabetesMedicalConditionOption =
                        !s9DiabetesMedicalConditionOption);
                  },
                  setSize: 250,
                  setText: 'High blood pressure',
                  bgColor: s9HighBloodPressureMedicalConditionOption
                      ? accentColor
                      : 0xFFFFFFFF,
                  borderColor: s9HighBloodPressureMedicalConditionOption
                      ? 0x00000000
                      : accentColor,
                  textColor: s9HighBloodPressureMedicalConditionOption
                      ? 0xFFFFFFFF
                      : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() => s9HighCholesterolMedicalConditionOption =
                        !s9HighCholesterolMedicalConditionOption);
                  },
                  setSize: 250,
                  setText: 'High cholesterol',
                  bgColor: s9HighCholesterolMedicalConditionOption
                      ? accentColor
                      : 0xFFFFFFFF,
                  borderColor: s9HighCholesterolMedicalConditionOption
                      ? 0x00000000
                      : accentColor,
                  textColor: s9HighCholesterolMedicalConditionOption
                      ? 0xFFFFFFFF
                      : 0xFF757575,
                ),
                const SizedBox(height: 10),
                DynamicButton(
                  onClick: () {
                    setState(() => s9ThyroidDisorderMedicalConditionOption =
                        !s9ThyroidDisorderMedicalConditionOption);
                  },
                  setSize: 250,
                  setText: 'Thyroid disorder',
                  bgColor: s9ThyroidDisorderMedicalConditionOption
                      ? accentColor
                      : 0xFFFFFFFF,
                  borderColor: s9ThyroidDisorderMedicalConditionOption
                      ? 0x00000000
                      : accentColor,
                  textColor: s9ThyroidDisorderMedicalConditionOption
                      ? 0xFFFFFFFF
                      : 0xFF757575,
                ),
                const SizedBox(height: 10),
                SmartTextField(
                  onChangeFunction: (value) {},
                  width: 250,
                  labelText: "Others",
                  errorText: "",
                  isValidInput: true,
                  keyboardType: TextInputType.text,
                  controllerName: othersMedicalConditionsController,
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
                  onClick: () => checkSelection(),
                  setText: "Finish",
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Survey9 extends StatefulWidget {
  const Survey9({super.key});

  @override
  State<Survey9> createState() => _Survey9State();
}
