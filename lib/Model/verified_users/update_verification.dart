import '../../includes.dart';

Future<int?> verifyUser(final String email) async {
  try {
    await supabase
        .from('verified_users')
        .update({'email_verified': true}).eq('email', email);
    printDebugMsg("Verified");
    return 200;
  } catch (e) {
    errorMessage = "Error while verifying account";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
