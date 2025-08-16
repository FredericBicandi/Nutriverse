import '../../includes.dart';

Future<void> checkUserAuth(BuildContext context) async {
  session = supabase.auth.currentSession;
  user = supabase.auth.currentUser;
  if (session != null && user != null) {
    printDebugMsg("user Authenticated successfully");
    Future.delayed(
      const Duration(seconds: 2),
      // ignore: use_build_context_synchronously
          () => newStackScreen(context, const Dashboard()),
    );
  } else {
    printDebugMsg("not existing authentication found!");
    Future.delayed(
      const Duration(seconds: 2),
      // ignore: use_build_context_synchronously
          () => newStackScreen(context, const WelcomeScreen()),
    );
  }
}