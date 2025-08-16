import '../../Model/users/save_user_info.dart';
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
  final selections = <String>[
    if (s1LivingLongerButtonPressed) 'Living Longer',
    if (s1FeelingEnergizedButtonPressed) 'Feeling Energized',
    if (s1OptimizeAthleticPerformanceButtonPressed) 'Optimize Athletic Performance',
    if (s1BuildHealthierHabitsButtonPressed) 'Build Healthier Habits',
    if (s1EliminateAllOrNothingMindsetButtonPressed) 'Eliminate All Or Nothing Mindset',
    if (s1PreventLifestyleDiseasesButtonPressed) 'Prevent Lifestyle Diseases',
  ];

  // store as CSV (or keep the list if your backend accepts arrays)
  final csv = selections.join(', ');
  surveyAnswers['AdditionalGoals'] = csv; // becomes '' if none selected

  printDebugMsg('AdditionalGoals => $csv');
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
  final allergiesList = <String>[
    if (s3dairyFoodAllergiesPressed) "Dairy",
    if (s3glutenFoodAllergiesPressed) "Gluten",
    if (s3nutsFoodAllergiesPressed) "Nuts",
    if (s3eggsFoodAllergiesPressed) "Eggs",
    if (s3shellfishFoodAllergiesPressed) "Shellfish",
    if (s3soyFoodAllergiesPressed) "Soy",
    if (othersFoodAllergiesController.text.isNotEmpty)
      "(${othersFoodAllergiesController.text})",
  ];

  final allergies = allergiesList.join(", ");

  surveyAnswers["Allergies"] = allergies; // will be "" if none selected
  printDebugMsg("Allergies => $allergies");
}

void survey4NextButton() {
  final items = <String>[
    if (s4PorkFoodAvoidPressed) "Pork",
    if (s4AlcoholFoodAvoidPressed) "Alcohol",
    if (s4RedMeatFoodAvoidPressed) "Red Meat",
    if (s4ArtificialSweetenersFoodAvoidPressed) "Artificial Sweeteners",
    if (s4ProcessedFoodsFoodAvoidPressed) "Processed Foods",
  ];

  final other = othersFoodAvoidController.text.trim();
  if (other.isNotEmpty) {
    // TODO: validate custom entry if needed
    items.add("($other)");
  }

  final avoid = items.join(", ");          // "" if none selected
  surveyAnswers["Avoid"] = avoid;          // or store `items` if backend accepts arrays

  printDebugMsg("Avoid => $avoid");
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
  final appliances = <String>[
    if (s8OvenKitchenAppliancesOption) "Oven",
    if (s8BlenderKitchenAppliancesOption) "Blender",
    if (s8AirFryerKitchenAppliancesOption) "Air Fryer",
    if (s8MicrowaveKitchenAppliancesOption) "Microwave",
    if (s8StoveKitchenAppliancesOption) "Stove",
  ];

  surveyAnswers["KitchenAppliances"] = appliances.join(", ");

  // Require at least one cooking frequency option
  final hasCookingFrequency =
      s8AlmostNeverCookAtHomeOption ||
          s8OneTwoPerWeekCookAtHomeOption ||
          s8ThreeFivePerWeekCookAtHomeOption ||
          s8DailyCookAtHomeOption;

  if (kDebugMode) print(surveyAnswers);

  return hasCookingFrequency;
}

Future<int?> survey9NextButton() async {
  final parts = <String>[];

  if (s9DiabetesMedicalConditionOption) parts.add('Diabetes');
  if (s9HighBloodPressureMedicalConditionOption) parts.add('High Blood Pressure');
  if (s9HighCholesterolMedicalConditionOption) parts.add('High Cholesterol');
  if (s9ThyroidDisorderMedicalConditionOption) parts.add('Thyroid Disorder');

  final other = othersMedicalConditionsController.text.trim();
  if (other.isNotEmpty) parts.add(other);

  final medicalConditions = parts.join(', ');

  surveyAnswers['MedicalConditions'] = medicalConditions;
  printDebugMsg("DATA RECEIVED:\n$surveyAnswers");
  return await saveSurveyInfo(surveyAnswers);
}
