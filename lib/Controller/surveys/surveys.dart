import '../../includes.dart';

TextEditingController othersFoodAvoidController = TextEditingController();
TextEditingController othersFoodAllergiesController = TextEditingController();
TextEditingController othersMedicalConditionsController =
    TextEditingController();

bool s1LivingLongerButtonPressed = false;
bool s1FeelingEnergizedButtonPressed = false;
bool s1BuildHealthierHabitsButtonPressed = false;
bool s1PreventLifestyleDiseasesButtonPressed = false;
bool s1OptimizeAthleticPerformanceButtonPressed = false;
bool s1EliminateAllOrNothingMindsetButtonPressed = false;

bool s2KetoDietPlanPressed = false;
bool s2VeganDietPlanPressed = false;
bool s2NoSpecificDietPlanPressed = false;
bool s2VegetarianDietPlanPressed = false;
bool s2PescatarianDietPlanPressed = false;
bool s2MediterraneanDietPlanPressed = false;

bool s3soyFoodAllergiesPressed = false;
bool s3eggsFoodAllergiesPressed = false;
bool s3nutsFoodAllergiesPressed = false;
bool s3dairyFoodAllergiesPressed = false;
bool s3glutenFoodAllergiesPressed = false;
bool s3shellfishFoodAllergiesPressed = false;

bool s4PorkFoodAvoidPressed = false;
bool s4AlcoholFoodAvoidPressed = false;
bool s4RedMeatFoodAvoidPressed = false;
bool s4ProcessedFoodsFoodAvoidPressed = false;
bool s4ArtificialSweetenersFoodAvoidPressed = false;

bool s5OneMealOption = false;
bool s5TwoMealsOption = false;
bool s5ThreeMealsOption = false;
bool s5FourPlusMealsOption = false;

bool s6RarelyEatFastFoodOption = false;
bool s6AlmostDailyEatFastFoodOption = false;
bool s6OneTwoPerWeekEatFastFoodOption = false;
bool s6ThreeFivePerWeekEatFastFoodOption = false;

bool s7LowProteinConsume = false;
bool s7HighProteinConsume = false;
bool s7LowFatMacronutrient = false;
bool s7ModerateProteinConsume = false;
bool s7HighCarbsMacronutrient = false;
bool s7HighProteinMacronutrient = false;
bool s7BalancedDietMacronutrient = false;

bool s8DailyCookAtHomeOption = false;
bool s8AlmostNeverCookAtHomeOption = false;
bool s8OneTwoPerWeekCookAtHomeOption = false;
bool s8ThreeFivePerWeekCookAtHomeOption = false;

bool s8OvenKitchenAppliancesOption = false;
bool s8StoveKitchenAppliancesOption = false;
bool s8BlenderKitchenAppliancesOption = false;
bool s8AirFryerKitchenAppliancesOption = false;
bool s8MicrowaveKitchenAppliancesOption = false;

bool s9DiabetesMedicalConditionOption = false;
bool s9ThyroidDisorderMedicalConditionOption = false;
bool s9HighCholesterolMedicalConditionOption = false;
bool s9HighBloodPressureMedicalConditionOption = false;

Map<String, String> surveyAnswers = {};

void startProgress(double progress, Function(double) updateProgress) {
  Timer.periodic(const Duration(milliseconds: 24), (timer) {
    if (progress >= 1.0) {
      timer.cancel();
    } else {
      updateProgress(progress += 0.05);
    }
  });
}

void survey1NextButton() {
  String additionalGoals = '';

  if (s1LivingLongerButtonPressed) {
    additionalGoals == ''
        ? additionalGoals = "Living Longer,"
        : additionalGoals = "Living Longer,$additionalGoals";
  }
  if (s1FeelingEnergizedButtonPressed) {
    additionalGoals == ''
        ? additionalGoals = "Feeling Energized,"
        : additionalGoals = "Feeling Energized,$additionalGoals";
  }
  if (s1OptimizeAthleticPerformanceButtonPressed) {
    additionalGoals == ''
        ? additionalGoals = "Optimize Athletic Performance,"
        : additionalGoals = "Optimize Athletic Performance,$additionalGoals";
  }
  if (s1BuildHealthierHabitsButtonPressed) {
    additionalGoals == ''
        ? additionalGoals = "Build Healthier Habits,"
        : additionalGoals = "Build Healthier Habits,$additionalGoals";
  }
  if (s1EliminateAllOrNothingMindsetButtonPressed) {
    additionalGoals == ''
        ? additionalGoals = "Eliminate All Or Nothing Mindset,"
        : additionalGoals = "Eliminate All Or Nothing Mindset,$additionalGoals";
  }
  if (s1PreventLifestyleDiseasesButtonPressed) {
    additionalGoals == ''
        ? additionalGoals = "Prevent Lifestyle Diseases,"
        : additionalGoals = "Prevent Lifestyle Diseases,$additionalGoals";
  }

  if (additionalGoals == '') {
    surveyAnswers["AdditionalGoals"] = '';
  } else {
    surveyAnswers["AdditionalGoals"] = additionalGoals;
  }

  printDebugMsg("$surveyAnswers");
}

void survey2ChoiceUpdate(String? dietPlan) {
  if (s2VeganDietPlanPressed) s2VeganDietPlanPressed = false;
  if (s2VegetarianDietPlanPressed) s2VegetarianDietPlanPressed = false;
  if (s2PescatarianDietPlanPressed) s2PescatarianDietPlanPressed = false;
  if (s2KetoDietPlanPressed) s2KetoDietPlanPressed = false;
  if (s2MediterraneanDietPlanPressed) s2MediterraneanDietPlanPressed = false;
  if (s2NoSpecificDietPlanPressed) s2NoSpecificDietPlanPressed = false;

  if (dietPlan == null) {
    surveyAnswers['DietPlan'] = '';
  } else {
    surveyAnswers['DietPlan'] = dietPlan;
  }
  printDebugMsg("$surveyAnswers");
}

bool survey2NextButton() {
  if (!s2VeganDietPlanPressed &&
      !s2VegetarianDietPlanPressed &&
      !s2PescatarianDietPlanPressed &&
      !s2KetoDietPlanPressed &&
      !s2MediterraneanDietPlanPressed &&
      !s2NoSpecificDietPlanPressed) {
    return false;
  }
  return true;
}

void survey3NextButton() {
  String allergies = '';

  if (s3dairyFoodAllergiesPressed) {
    allergies == '' ? allergies = "Dairy," : allergies = "Dairy,$allergies";
  }
  if (s3glutenFoodAllergiesPressed) {
    allergies == '' ? allergies = "gluten" : allergies = "gluten,$allergies";
  }
  if (s3nutsFoodAllergiesPressed) {
    allergies == '' ? allergies = "nuts" : allergies = "nuts,$allergies";
  }
  if (s3eggsFoodAllergiesPressed) {
    allergies == '' ? allergies = "eggs" : allergies = "eggs,$allergies";
  }
  if (s3shellfishFoodAllergiesPressed) {
    allergies == ''
        ? allergies = "shellfish"
        : allergies = "shellfish,$allergies";
  }
  if (s3soyFoodAllergiesPressed) {
    allergies == '' ? allergies = "soy" : allergies = "soy,$allergies";
  }

  if (othersFoodAllergiesController.text.isNotEmpty) {
    // TODO::Check if valid allergies using gpt api
    allergies = "$allergies,(${othersFoodAllergiesController.text})";
  } else {
    allergies = "$allergies${othersFoodAllergiesController.text}";
  }
  if (allergies.isNotEmpty || allergies != '') {
    surveyAnswers["Allergies"] = allergies;
  } else {
    surveyAnswers["Allergies"] = '';
  }
  printDebugMsg("$surveyAnswers");
}

void survey4NextButton() {
  String avoidFood = '';

  if (s4PorkFoodAvoidPressed) {
    avoidFood == '' ? avoidFood = "Pork," : avoidFood = "Pork,$avoidFood";
  }
  if (s4AlcoholFoodAvoidPressed) {
    avoidFood == '' ? avoidFood = "Alcohol," : avoidFood = "Alcohol,$avoidFood";
  }
  if (s4RedMeatFoodAvoidPressed) {
    avoidFood == ''
        ? avoidFood = "Red Meat,"
        : avoidFood = "Red Meat,$avoidFood";
  }
  if (s4ArtificialSweetenersFoodAvoidPressed) {
    avoidFood == ''
        ? avoidFood = "Artificial Sweeteners,"
        : avoidFood = "Artificial Sweeteners,$avoidFood";
  }
  if (s4ProcessedFoodsFoodAvoidPressed) {
    avoidFood == ''
        ? avoidFood = "Processed Foods,"
        : avoidFood = "Processed Foods,$avoidFood";
  }

  if (othersFoodAvoidController.text.isNotEmpty) {
    // TODO::Check if valid allergies using gpt api
    avoidFood = "$avoidFood(${othersFoodAvoidController.text})";
  } else {
    avoidFood = "$avoidFood${othersFoodAvoidController.text}";
  }
  if (avoidFood.isNotEmpty || avoidFood != '') {
    surveyAnswers["Avoid"] = avoidFood;
  } else {
    surveyAnswers["Avoid"] = '';
  }

  printDebugMsg("$surveyAnswers");
}

void survey5ChoiceUpdate(String numberOfMeals) {
  s5OneMealOption = false;
  s5TwoMealsOption = false;
  s5ThreeMealsOption = false;
  s5FourPlusMealsOption = false;
  surveyAnswers['MealsNumber'] = numberOfMeals;
  printDebugMsg("$surveyAnswers");
}

bool survey5NextButton() {
  if (!s5OneMealOption &&
      !s5TwoMealsOption &&
      !s5ThreeMealsOption &&
      !s5FourPlusMealsOption) {
    return false;
  }
  return true;
}

void survey6ChoiceUpdate(String fastFoodMeals) {
  s6RarelyEatFastFoodOption = false;
  s6OneTwoPerWeekEatFastFoodOption = false;
  s6ThreeFivePerWeekEatFastFoodOption = false;
  s6AlmostDailyEatFastFoodOption = false;

  surveyAnswers['FastFood'] = fastFoodMeals;
  printDebugMsg("$surveyAnswers");

}

bool survey6NextButton() {
  if (!s6RarelyEatFastFoodOption &&
      !s6OneTwoPerWeekEatFastFoodOption &&
      !s6ThreeFivePerWeekEatFastFoodOption &&
      !s6AlmostDailyEatFastFoodOption) {
    return false;
  }
  return true;
}

void survey7ChoiceUpdate(String macroNutrient) {
  surveyAnswers['Macronutrient'] = macroNutrient;

  printDebugMsg("$surveyAnswers");

}

void survey7Choice2Update(String proteinConsume) {
  surveyAnswers['DailyProteinConsume'] = proteinConsume;
  printDebugMsg("$surveyAnswers");

}

void survey8ChoiceUpdate(String homeMealOften) {
  s8AlmostNeverCookAtHomeOption = false;
  s8OneTwoPerWeekCookAtHomeOption = false;
  s8ThreeFivePerWeekCookAtHomeOption = false;
  s8DailyCookAtHomeOption = false;

  surveyAnswers['HomeMealOften'] = homeMealOften;
  printDebugMsg("$surveyAnswers");

}

bool survey8NextButton() {
  String kitchenAppliances = '';

  if (s8OvenKitchenAppliancesOption) {
    kitchenAppliances == ''
        ? kitchenAppliances = "Oven,"
        : kitchenAppliances = "Oven,$kitchenAppliances";
  }
  if (s8BlenderKitchenAppliancesOption) {
    kitchenAppliances == ''
        ? kitchenAppliances = "Blender,"
        : kitchenAppliances = "Blender,$kitchenAppliances";
  }
  if (s8AirFryerKitchenAppliancesOption) {
    kitchenAppliances == ''
        ? kitchenAppliances = "Air Fryer,"
        : kitchenAppliances = "Air Fryer,$kitchenAppliances";
  }
  if (s8MicrowaveKitchenAppliancesOption) {
    kitchenAppliances == ''
        ? kitchenAppliances = "Microwave,"
        : kitchenAppliances = "Microwave,$kitchenAppliances";
  }
  if (s8StoveKitchenAppliancesOption) {
    kitchenAppliances == ''
        ? kitchenAppliances = "Stove,"
        : kitchenAppliances = "Stove,$kitchenAppliances";
  }

  if (kitchenAppliances == '') {
    surveyAnswers["KitchenAppliances"] = '';
  } else {
    surveyAnswers["KitchenAppliances"] = kitchenAppliances;
  }

  if (!s8AlmostNeverCookAtHomeOption &&
      !s8OneTwoPerWeekCookAtHomeOption &&
      !s8ThreeFivePerWeekCookAtHomeOption &&
      !s8DailyCookAtHomeOption) {
    return false;
  }
  if (kDebugMode) print(surveyAnswers);
  return true;
}

Future<int?> survey9NextButton() async {
  String medicalConditions = '';

  if (s9DiabetesMedicalConditionOption) {
    medicalConditions == ''
        ? medicalConditions = "Diabetes,"
        : medicalConditions = "Diabetes,$medicalConditions";
  }
  if (s9HighBloodPressureMedicalConditionOption) {
    medicalConditions == ''
        ? medicalConditions = "High Blood Pressure,"
        : medicalConditions = "High Blood Pressure,$medicalConditions";
  }
  if (s9HighCholesterolMedicalConditionOption) {
    medicalConditions == ''
        ? medicalConditions = "High Cholesterol,"
        : medicalConditions = "High Cholesterol,$medicalConditions";
  }
  if (s9ThyroidDisorderMedicalConditionOption) {
    medicalConditions == ''
        ? medicalConditions = "Thyroid Disorder,"
        : medicalConditions = "Thyroid Disorder,$medicalConditions";
  }

  if (othersMedicalConditionsController.text.isNotEmpty) {
    // TODO::Check if valid allergies using gpt api
    medicalConditions =
        "$medicalConditions,(${othersMedicalConditionsController.text})";
  } else {
    medicalConditions =
        "$medicalConditions${othersMedicalConditionsController.text}";
  }
  if (medicalConditions.isNotEmpty || medicalConditions != '') {
    surveyAnswers["MedicalConditions"] = medicalConditions;
  } else {
    surveyAnswers["MedicalConditions"] = '';
  }

    printDebugMsg("$surveyAnswers");
    printDebugMsg("DATA RECEIVED:\n");
  // final Auth saveData = Auth();
  // int? response = await saveData.saveUserSurveyData(surveyAnswers);
  return null;
}
