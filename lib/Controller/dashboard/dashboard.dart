import '../../includes.dart';

Future<bool> checkUserInfo(BuildContext context) async {
  if (userInfo['avoid'] == null &&
      userInfo['fast_food'] == null &&
      userInfo['diet_plan'] == null &&
      userInfo['allergies'] == null &&
      userInfo['meals_number'] == null &&
      userInfo['macronutrient'] == null &&
      userInfo['home_meal_often'] == null &&
      userInfo['additional_goals'] == null &&
      userInfo['kitchen_appliances'] == null &&
      userInfo['medical_conditions'] == null &&
      userInfo['daily_protein_consume'] == null
  ) {
    // ignore: use_build_context_synchronously
    newStackScreen(context, const Survey1());
    // All values are null
    printDebugMsg("All optional fields are null throwing surveys");
    return true;
  } else if (userInfo == null) {
    // ignore: use_build_context_synchronously
    await iosAlert(context, "error", errorMessage!);
  }

  return false;
}
