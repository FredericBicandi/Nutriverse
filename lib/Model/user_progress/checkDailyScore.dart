import 'package:nutritracker/Model/user_progress/update_user_email.dart';

import '../../includes.dart';

Future<bool> checkDailyScore() async {
  try {
    final today =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    printDebugMsg("Date from phone=> $today");
    final response = await supabase
        .from('user_progress')
        .select()
        .eq('user_id', userInfo['id'])
        .eq('created_at', today)
        .maybeSingle();

    if (response != null)
    {
      updateInfo("calorie_score", response["calorie_score"]);
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
