import 'package:nutritracker/View/surveys/survey1.dart';

import '../../Model/users/get_user_info.dart';
import '../../includes.dart';

Future<bool> checkUserInfo(BuildContext context) async {
  final response = await getUserInfo();
  if (response != null &&
      response['avoid'] == null &&
      response['fast_food'] == null &&
      response['diet_plan'] == null &&
      response['allergies'] == null &&
      response['meals_number'] == null &&
      response['macronutrient'] == null &&
      response['home_meal_often'] == null &&
      response['additional_goals'] == null &&
      response['kitchen_appliances'] == null &&
      response['medical_conditions'] == null &&
      response['daily_protein_consume'] == null
  ) {
    // ignore: use_build_context_synchronously
    newStackScreen(context, const Survey1());
    // All values are null
    printDebugMsg("All optional fields are null throwing surveys");
    return true;
  } else if (response == null) {
    // ignore: use_build_context_synchronously
    await iosAlert(context, "error", errorMessage!);
  }
  return false;
}
