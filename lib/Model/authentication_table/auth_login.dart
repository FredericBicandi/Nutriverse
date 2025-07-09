import '../../includes.dart';

Future<int> userAuth(final String email, final String password) async {
  try {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return 200;
  } on AuthException catch (e) {
    errorMessage = "Failed to authenticate user";
    printDebugMsg("$errorMessage: ${e.message}");
    return e.message.contains("Failed host lookup") ? 500 : 401;
  } catch (e) {
    errorMessage = "Unknown Error while authenticating";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
