import '../../includes.dart';

Future<int?> unverifiedUserCreate(final String email) async {
  try {
    await supabase.from('verified_users').insert({
      "email": email,
    });
    return 200;
  } catch (e) {
    errorMessage = "Error while creating user account";
    printDebugMsg("$errorMessage => $e");
    return 500;
  }
}
