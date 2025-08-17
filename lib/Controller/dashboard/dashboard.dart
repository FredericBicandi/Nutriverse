import '../../includes.dart';

Future<bool> checkUserInfo() async {
  final allNull =
      userInfo['avoid'] == null &&
          userInfo['fast_food'] == null &&
          userInfo['diet_plan'] == null &&
          userInfo['allergies'] == null &&
          userInfo['meals_number'] == null &&
          userInfo['macronutrient'] == null &&
          userInfo['home_meal_often'] == null &&
          userInfo['additional_goals'] == null &&
          userInfo['kitchen_appliances'] == null &&
          userInfo['medical_conditions'] == null &&
          userInfo['daily_protein_consume'] == null;

  return allNull;
}
