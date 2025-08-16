import 'package:nutritracker/Model/authentication_table/auth_login.dart';
import 'package:nutritracker/Model/users/get_user_info.dart';
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
      final  res = await getUserInfo(emailController.text.trim());
      if (res == null) {
        // ignore: use_build_context_synchronously
        return await iosAlert(context, "Error", errorMessage!);
      }
      userInfo = res;
      // ignore: use_build_context_synchronously
      return routeTo(context, const Dashboard());
    }
    printDebugMsg("not existing authentication found!");
    // ignore: use_build_context_synchronously
    return routeTo(context, const WelcomeScreen());
  } else {
    session = supabase.auth.currentSession;
    user = supabase.auth.currentUser;
    if (session != null && user != null) {
      printDebugMsg("user Authenticated successfully");
      final  res = getUserInfo(emailController.text.trim());
      if (res == null) {
        return await iosAlert(context, "Error", errorMessage!);
      }
      userInfo = res as Map<String, dynamic>;
      return routeTo(context, const Dashboard());
    }
    printDebugMsg("not existing authentication found!");
    return routeTo(context, const WelcomeScreen());
  }
}
