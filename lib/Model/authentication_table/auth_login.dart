import '../../includes.dart';

Future<int> userAuth(final String email, final String password) async {
  try {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return 200;
  } on AuthException catch (e) {
    printDebugMsg("Auth Error: ${e.message}");
    return e.message.contains("Failed host lookup") ? 500 : 401;
  } catch (e) {
    printDebugMsg("Unknown Error: $e");
    return 500;
  }
}
