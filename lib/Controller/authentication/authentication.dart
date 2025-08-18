import 'package:nutritracker/Model/authentication_table/auth_login.dart';
import 'package:nutritracker/Model/users/get_user_info.dart';
import '../../Model/verified_users/check_verification.dart';
import '../../includes.dart';

void routeTo(BuildContext context, Widget screen) =>
    Future.delayed(const Duration(seconds: 2), () => newStackScreen(context, screen));

Future<void> checkUserAuth(BuildContext context) async {
  final currentSession = supabase.auth.currentSession;
  final currentUser = supabase.auth.currentUser;

  if (currentSession != null && currentUser != null) {
    final res = await getUserInfo(currentUser.email);
    userInfo = res!;
    imageUrl = userInfo['photo'];

    if (await checkVerification(currentUser.email!) == 404) {
      emailController.text = currentUser.email!;
      return newStackScreen(context, const EmailVerification());
    }
    return routeTo(context, const Dashboard());
  }
  return routeTo(context, const WelcomeScreen());
}
