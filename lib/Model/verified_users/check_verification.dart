import '../../includes.dart';

Future<int?> checkVerification(final String email) async {
  try {
    final response = await supabase
        .from('verified_users')
        .select()
        .eq('email', email)
        .eq('email_verified', true)
        .maybeSingle();

    if (response != null) {
      printDebugMsg('User is verified!');
    } else {
      printDebugMsg('User is not verified.');
      return 404;
    }
    return 200;
  } catch (e) {
    errorMessage = "Error while creating user account";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
