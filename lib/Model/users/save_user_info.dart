import '../../includes.dart';

Future<int?> saveUserInfo(final String email) async {
  try {
    await supabase.from('users').insert({
      "email": email,
      "photo": imageUrl,
      "height": userInfo["Height"],
      "weight": userInfo["Weight"],
      "bmi": userInfo["BMI"],
      "age": userInfo["Age"],
      "birthdate": userInfo["DOB"],
      "gender": userInfo["Gender"] == "Female" ? false : true,
      "goal": userInfo["Goal"],
    });
    return 200;
  } catch (e) {
    errorMessage = "Error while creating user account";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}

Future<int?> saveSurveyInfo(Map<String, String> data) async {
  try {
    final response = await supabase
        .from('users')
        .update({
          'additional_goals': data['AdditionalGoals'],
          'diet_plan': data['DietPlan'],
          'allergies': data['Allergies'],
          'avoid': data['Avoid'],
          'meals_number': data['MealsNumber'],
          'fast_food': data['FastFood'],
          'macronutrient': data['Macronutrient'],
          'daily_protein_consume': data['DailyProteinConsume'],
          'home_meal_often': data['HomeMealOften'],
          'kitchen_appliances': data['KitchenAppliances'],
          'medical_conditions': data['MedicalConditions']
        })
        .eq('email', user?.email ?? emailController.text)
        .select();
    printDebugMsg("user Data =>$response after UPDATE");
    return 200;
  } catch (e) {
    errorMessage = "Error while creating user account" ;
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
