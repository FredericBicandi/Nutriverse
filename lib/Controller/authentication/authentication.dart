import '../../Model/user_progress/save_user_info.dart';
import '../../Model/users/get_user_info.dart';
import '../../Model/verified_users/check_verification.dart';
import '../../includes.dart';

void routeTo(BuildContext context, Widget screen) => Future.delayed(const Duration(seconds: 2), () => newStackScreen(context, screen));


Future<void> checkUserAuth(BuildContext context) async {
  final currentSession = supabase.auth.currentSession;
  final currentUser = supabase.auth.currentUser;

  if (currentSession != null && currentUser != null) {
    final res = await getUserInfo(currentUser.email);
    userInfo = res!;
    userInfo['name'] = currentUser.userMetadata?['display_name'];
    if(userInfo['photo'] !=null) imageUrl = userInfo['photo'];
    else{
      if (userInfo['gender']) imageUrl = "Avatar_male.png";
      else imageUrl = "Avatar_female.png";
    }

    if (await checkVerification(currentUser.email!) == 404) {
      emailController.text = currentUser.email!;
      return newStackScreen(context, const EmailVerification());
    }
    await generatedDailyScore();
    //TODO:: create the Model to store this number
    //TODO:: make the first row for user_progress when signing in depending on the date
    //TODO:: fix user static image not working on creating account
    return routeTo(context, const Dashboard());
  }
  return routeTo(context, const WelcomeScreen());
}
