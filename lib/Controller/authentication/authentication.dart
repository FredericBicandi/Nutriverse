import 'package:nutritracker/Model/authentication_table/auth_login.dart';
import 'package:nutritracker/Model/users/get_user_info.dart';
import '../../Model/verified_users/check_verification.dart';
import '../../includes.dart';

void routeTo(BuildContext context, Widget screen) => Future.delayed(
      const Duration(seconds: 2),
      // ignore: use_build_context_synchronously
      () => newStackScreen(context, screen),
    );

Future<void> checkUserAuth(BuildContext context) async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    final response = await userAuth(
      emailController.text.trim().toLowerCase(),
      passwordController.text,
    );
    if (response == 200) {
      printDebugMsg("user Authenticated successfully");
      final res = await getUserInfo(emailController.text.trim());
      if (res == null) {
        await supabase.auth.signOut(scope: SignOutScope.local);
        return await iosAlert(context, "Error", errorMessage!);
      }
      userInfo = res;
      return routeTo(context, const Dashboard());
    }
    printDebugMsg("not existing authentication found! as email and password");
    return routeTo(context, const WelcomeScreen());
  } else {
    final currentSession = supabase.auth.currentSession;
    final currentUser = supabase.auth.currentUser;

    if (currentSession != null && currentUser != null) {
      printDebugMsg("user Authenticated successfully ${currentUser.email}");
      final res = await getUserInfo(currentUser.email);
      if (await checkVerification(currentUser.email!) == 404) {
        emailController.text=currentUser.email!;
        return newStackScreen(context, const EmailVerification());
      }
      if (res == null) {
        newStackScreen(context, const Survey1());
        return;
      }
      userInfo = res;
      imageUrl = userInfo['photo'];
      return routeTo(context, const Dashboard());
    }

    printDebugMsg("not existing authentication found!");
    return routeTo(context, const WelcomeScreen());
  }
}
