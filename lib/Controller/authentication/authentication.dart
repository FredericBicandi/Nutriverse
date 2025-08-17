import 'package:nutritracker/Model/authentication_table/auth_login.dart';
import 'package:nutritracker/Model/users/get_user_info.dart';
import '../../Model/verified_users/check_verification.dart';
import '../../includes.dart';

void routeTo(BuildContext context, Widget screen) {
   Future.delayed(const Duration(seconds: 2), () => newStackScreen(context, screen));
}

Future<void> checkUserAuth(BuildContext context) async {
  String email=emailController.text.toLowerCase().trim();
  String password=passwordController.text;

  if (email.isNotEmpty && password.isNotEmpty) {
    final response = await userAuth(email, password);
    if (response == 200) {
      final res = await getUserInfo(email);
      if (res == null) {
        await supabase.auth.signOut(scope: SignOutScope.local);
        return await iosAlert(context, "Error", errorMessage!);
      }
      userInfo = res;
      return routeTo(context, const Dashboard());
    }

    return routeTo(context, const WelcomeScreen());
  } else {
    final currentSession = supabase.auth.currentSession;
    final currentUser = supabase.auth.currentUser;

    if (currentSession != null && currentUser != null) {
      final res = await getUserInfo(currentUser.email);
      if (await checkVerification(currentUser.email!) == 404) {
        emailController.text=currentUser.email!;
        return newStackScreen(context, const EmailVerification());
      }
      if (res == null) return newStackScreen(context, const Survey1());

      userInfo = res;
      imageUrl = userInfo['photo'];
      return routeTo(context, const Dashboard());
    }
    return routeTo(context, const WelcomeScreen());
  }
}
