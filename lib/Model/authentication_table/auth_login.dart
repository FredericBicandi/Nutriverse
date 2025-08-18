import '../../includes.dart';

Future<int> userAuth(final String email, final String password) async {
  try {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    session = supabase.auth.currentSession;
    user = supabase.auth.currentUser;
    return 200;
  } on AuthException catch (e) {
    if (e.message.contains("Failed host lookup")) {
      printDebugMsg("$errorMessage: ${e.message}");
      errorMessage = "Check your internet connection!";
      return 500;
    }
    errorMessage = "Failed to authenticate user";
    printDebugMsg("$errorMessage: ${e.message}");
    return 401;
  } catch (e) {
    errorMessage = "Unknown Error while authenticating";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
