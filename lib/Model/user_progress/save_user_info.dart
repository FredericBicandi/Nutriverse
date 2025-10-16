import 'package:nutritracker/Controller/create_account/.create_account.dart';
import '../../includes.dart';
import '../gemini/gemini.dart';
import 'checkDailyScore.dart';

Future<int?> generatedDailyScore() async {
  try {
    if(!await checkDailyScore())
    {
      final int? kcal=await Gemini().getTotalKcalDay();
      final today = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
      await supabase.from('user_progress').insert({
        "user_id": userInfo['id'],
        "calorie_score":kcal,
        "created_at":today,
      });
      updateUserInfo("calorie_score",kcal.toString());
    }
    return 200;
  } catch (e) {
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
